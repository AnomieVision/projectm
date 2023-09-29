import { execSync } from "child_process";
import { promises as fs, existsSync, readdirSync, statSync } from "fs";
import { join } from "path";

// Global variables
const root = process.cwd();
const pm = join(root, ".pm");
const docs = join(root, "content/docs");
const api = join(root, "content/docs/api");
const doxygen = join(pm, ".doxygen");
const doxybook = join(pm, ".doxybook");
const dataDir = join(root, "data");

// Doxygen variables
const doxygenConfig = join(doxygen, "Doxyfile");
const doxygenOutput = join(doxygen, "xml");

// Doxybook2 variables
const doxybookTemp = join(doxybook, ".temp");
const doxybookConfig = join(doxybook, "config.json");
const doxybookOutput = join(doxybook, "api");
const doxybookTemplates = join(doxybook, "templates");

// ------ Util Functions ------

// Create directory if it doesn't exist
export async function createDirectory(dir: string, recreate: boolean = false) {
  if (!existsSync(dir)) {
    await fs.mkdir(dir);
  } else if (existsSync(dir) && recreate) {
    await fs.rm(dir, { recursive: true, force: true });
    await fs.mkdir(dir);
  }
}

// Copy directory recursively
async function copyDirectory(source: string, target: string) {
  await createDirectory(target, true);

  const items = readdirSync(source);

  for (const item of items) {
    const sourcePath = join(source, item);
    const targetPath = join(target, item);
    const stats = statSync(sourcePath);

    if (stats.isDirectory()) {
      await copyDirectory(sourcePath, targetPath);
    } else {
      await fs.copyFile(sourcePath, targetPath);
    }
  }
}

// ------ Main Functions ------

// Install doxygen, if not installed.
async function installDoxygen() {
  try {
    execSync("doxygen --version > /dev/null 2>&1");
  } catch (error) {
    console.log("Doxygen not found. Installing...");
    execSync("sudo apt update");
    execSync("sudo apt install doxygen -y");
  }
}

// Install doxybook2, if not installed.
async function installDoxybook() {
  try {
    execSync("doxybook2 --version > /dev/null 2>&1");
  } catch (error) {
    console.log("Doxybook2 not found. Installing...");
    await fs.mkdir(doxybookTemp, { recursive: true });
    process.chdir(doxybookTemp);
    execSync(
      "wget https://github.com/matusnovak/doxybook2/releases/download/v1.5.0/doxybook2-linux-amd64-v1.5.0.zip"
    );
    execSync("unzip doxybook2-linux-amd64-v1.5.0.zip");
    execSync("sudo mv ./bin/doxybook2 /usr/local/bin");
    execSync("sudo chmod +x /usr/local/bin/doxybook2");
    process.chdir(root);
    await fs.rm(doxybookTemp, { recursive: true, force: true });
  }
}

// Manage directories
async function manageDirectories() {
  await createDirectory(doxygenOutput, true);
  await createDirectory(doxybookOutput, true);
  await createDirectory(api, true);
}

// Generate docs using doxygen and doxybook2.
async function generateDocs() {
  execSync(`doxygen ${doxygenConfig}`);
  execSync(
    `doxybook2 --input ${doxygenOutput} --output ${doxybookOutput} --templates ${doxybookTemplates} --config ${doxybookConfig}`
  );
}

// Remove unwanted files including subdirectories
async function removeUnwanted() {
  const files = await fs.readdir(doxybookOutput);

  for (const file of files) {
    const filePath = join(doxybookOutput, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile()) {
      if (file.startsWith("dir_")) {
        await fs.rm(filePath);
      }
    }

    if (stats.isDirectory()) {
      const dirFiles = await fs.readdir(filePath);

      for (const dirFile of dirFiles) {
        const dirFilePath = join(filePath, dirFile);
        const dirStats = await fs.stat(dirFilePath);

        if (dirStats.isFile()) {
          if (dirFile.startsWith("dir_")) {
            await fs.rm(dirFilePath);
          }
        }
      }
    }
  }
}

// Modify generated api files names
async function modifyNames() {
  const files = await fs.readdir(doxybookOutput);

  for (const file of files) {
    const filePath = join(doxybookOutput, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile()) {
      const fileName = file.split(".")[0];
      const newFileName = fileName.replace(/__/g, "_").replace(/_8h/g, ".h");

      await fs.rename(filePath, join(doxybookOutput, `${newFileName}.md`));
    }

    if (stats.isDirectory()) {
      const dirFiles = await fs.readdir(filePath);

      for (const dirFile of dirFiles) {
        const dirFilePath = join(filePath, dirFile);
        const dirStats = await fs.stat(dirFilePath);

        if (dirStats.isFile()) {
          const fileName = dirFile.split(".")[0];
          const newFileName = fileName
            .replace(/__/g, "_")
            .replace(/_8h/g, ".h");

          await fs.rename(dirFilePath, join(filePath, `${newFileName}.md`));
        }
      }
    }
  }
}

// Fix generated api links
async function fixLinks() {
  async function fixUnderscores() {
    const files = await fs.readdir(doxybookOutput);

    for (const file of files) {
      const filePath = join(doxybookOutput, file);
      const stats = await fs.stat(filePath);

      if (stats.isFile()) {
        let content = await fs.readFile(filePath, "utf-8");
        content = content.replace(/__/g, "_").replace(/_8h.md/g, ".h");
        content = content.replace(/files\//g, "/docs/api/"); //temp

        console.log("filePath", filePath);

        await fs.writeFile(filePath, content, { encoding: "utf8", flag: "w" });
      }

      if (stats.isDirectory()) {
        const dirFiles = await fs.readdir(filePath);

        for (const dirFile of dirFiles) {
          const dirFilePath = join(filePath, dirFile);
          const dirStats = await fs.stat(dirFilePath);

          if (dirStats.isFile()) {
            let content = await fs.readFile(dirFilePath, "utf-8");
            content = content.replace(/__/g, "_").replace(/_8h.md/g, ".h");
            content = content.replace(/files\//g, "/docs/api/"); //temp

            await fs.writeFile(dirFilePath, content, {
              encoding: "utf8",
              flag: "w",
            });
          }
        }
      }
    }
  }

  await fixUnderscores();
}

// Move generated .pm/.doxybook/api to content/api
async function moveToApi() {
  const files = `${doxybookOutput}/Files`;

  copyDirectory(files, api);
}

// Combine magic functions
async function doMagic() {
  await removeUnwanted();
  await modifyNames();
  await fixLinks();
  await moveToApi();
}

// Generate api-menu-links.json
async function generateApiMenuLinks() {
  await new Promise((resolve) => setTimeout(resolve, 2000));

  const apiMenuLinks = [];
  const files = await fs.readdir(api);

  for (const file of files) {
    const filePath = join(api, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile()) {
      const fileName = file.split(".")[0];
      const link = `/docs/api/${fileName}.h`;

      if (fileName === "index") {
        continue;
      }

      apiMenuLinks.push({
        label: fileName + ".h",
        icon: "bx:file",
        iconClass: "",
        to: link.toLowerCase(),
        divider: true,
        links: [],
      });
    }
  }

  await createDirectory(dataDir, true);

  await fs.writeFile(
    join(dataDir, "api-menu-links.json"),
    JSON.stringify(apiMenuLinks, null, 2),
    { encoding: "utf8", flag: "w" }
  );
}

// Generate api/index.md
async function generateApiIndex() {
  await new Promise((resolve) => setTimeout(resolve, 2000));

  const apiMenuLinks = [];
  const files = await fs.readdir(api);

  for (const file of files) {
    const filePath = join(api, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile()) {
      const fileName = file.split(".")[0];
      const link = `/docs/api/${fileName}.h`;

      // Get description from first line of file, everything before [More...]
      const description = await fs
        .readFile(filePath, "utf-8")
        .then((content) => {
          const lines = content.split("\n");
          const firstLine = lines[0];
          const firstLineSplit = firstLine.split("[More...]");

          return firstLineSplit[0];
        });

      if (fileName === "index") {
        continue;
      }

      apiMenuLinks.push({
        label: fileName + ".h",
        description,
        icon: "bx:file",
        iconClass: "",
        to: link,
        divider: true,
        links: [],
      });
    }
  }

  await fs.rm(join(api, "index.md"));

  for (const link of apiMenuLinks) {
    const spacing = () => {
      if (link.description.length > 0) {
        return "<br />";
      } else {
        return "<br /> <br />";
      }
    };

    const content = `[Filename: ${link.label}](${link.to.toLowerCase()})
<br />
Description: ${link.description}
${spacing()}

`;

    await fs.writeFile(join(api, "index.md"), content, {
      encoding: "utf8",
      flag: "a",
    });
  }
}

// Cleanup leftover directories and files
async function cleanup() {
  await fs.rm(doxygenOutput, { recursive: true, force: true });
  await fs.rm(doxybookOutput, { recursive: true, force: true });
}

// Main function
async function main() {
  await installDoxygen();
  await installDoxybook();
  await manageDirectories();
  await generateDocs();
  await doMagic();
  await generateApiMenuLinks();
  await generateApiIndex();
  await cleanup();
}

main();
