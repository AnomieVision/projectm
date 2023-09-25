import { execSync } from 'child_process';
import { promises as fs } from 'fs';
import { join } from 'path';

// Create directory if doesnt exist.
async function createDirectory(path: string) {
  try {
    await fs.mkdir(path, { recursive: true });
    console.log(`Directory created at: ${path}`);
  } catch (error) {}
}
// Install doxygen, if not installed.
async function installDoxygen() {
  try {
    execSync('doxygen --version');
  } catch (error) {
    console.log('Doxygen not found. Installing...');
    execSync('sudo apt update');
    execSync('sudo apt install doxygen -y');
  }
}

// Install doxybook2, if not installed.
async function installDoxybook2() {
  const root = process.cwd();
  const temp = join(root, '.doxybook', '.temp');

  try {
    execSync('doxybook2 --version');
    console.log();
  } catch (error) {
    console.log('Doxybook2 not found. Installing...');
    await fs.mkdir(temp, { recursive: true });
    process.chdir(temp);
    await execSync(
      'wget https://github.com/matusnovak/doxybook2/releases/download/v1.5.0/doxybook2-linux-amd64-v1.5.0.zip'
    );
    await execSync('unzip doxybook2-linux-amd64-v1.5.0.zip');
    await execSync('sudo mv ./bin/doxybook2 /usr/local/bin');
    await execSync('sudo chmod +x /usr/local/bin/doxybook2');
    process.chdir(root);
    await fs.rm(temp, { recursive: true, force: true });
  }
}

// Recreate generated and api directories.
async function manageDirectories() {
  const generatedDir = join(process.cwd(), '.doxybook', 'generated');
  const apiDir = join(process.cwd(), 'content', 'api');

  try {
    await fs.rm(generatedDir, { recursive: true });
  } catch (error) {}

  try {
    await fs.mkdir(generatedDir, { recursive: true });
  } catch (error) {}

  try {
    await fs.rm(apiDir, { recursive: true });
  } catch (error) {}

  try {
    await fs.mkdir(apiDir, { recursive: true });
  } catch (error) {}
}

// Generate docs using doxygen and doxybook2.
async function generateDocs() {
  execSync('doxygen ./.doxygen/Doxyfile');
  execSync(
    'doxybook2 --input ./.doxygen/xml --output ./.doxybook/generated --templates ./.doxybook/templates --config ./.doxybook/config.json'
  );
}

// Move and rename wanted files.
async function doSomeMagic() {
  const apiDir = join(process.cwd(), 'content', 'api');
  const projectmDir = join(apiDir, 'projectm');
  const playlistDir = join(apiDir, 'playlist');
  const generatedFilesDir = join(process.cwd(), '.doxybook', 'generated', 'Files');

  try {
    await fs.rm(apiDir, { recursive: true });
    await fs.mkdir(apiDir, { recursive: true });
    await fs.mkdir(projectmDir, { recursive: true });
    await fs.mkdir(playlistDir, { recursive: true });
  } catch (error) {}

  const files = await fs.readdir(generatedFilesDir);
  for (const file of files) {
    const filePath = join(generatedFilesDir, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile()) {
      let filename = file.split('.')[0];
      if (filename.endsWith('_8h')) {
        filename = filename.slice(0, -3);
      } else if (filename.includes('dir_')) {
        continue;
      }

      console.log('filename', filename);

      if (filename.startsWith('index')) {
        continue;
      } else if (filename.startsWith('projectm-eval')) {
        await fs.rename(filePath, join(apiDir, `${filename}.md`));
      } else if (filename.includes('export')) {
        continue;
      } else if (filename.startsWith('playlist__')) {
        const subdirectory = filename.split('__')[0];
        const newFilename = filename.split('__')[1];
        await fs.mkdir(join(apiDir, subdirectory), { recursive: true });
        await fs.rename(filePath, join(apiDir, subdirectory, `${newFilename}.md`));
      } else if (filename === 'playlist') {
        await fs.rename(filePath, join(apiDir, 'playlist', 'index.md'));
      } else if (filename === 'projectM') {
        await fs.rename(filePath, join(apiDir, 'projectm', 'index.md'));
      } else {
        filename = filename.replace(/__/g, '-').replace(/_/g, '-').toLowerCase();
        await fs.rename(filePath, join(apiDir, 'projectm', `${filename}.md`));
      }
    }
  }
}

// Fix urls
async function fixUrls() {
  // Iterate through all files in api directory, and remove _8h and /files from all strings in side the files.
  const apiDir = join(process.cwd(), 'content', 'api');
  const files = await fs.readdir(apiDir);

  for (const file of files) {
    const filePath = join(apiDir, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile() && filePath.endsWith('.md')) {
      let content = await fs.readFile(filePath, 'utf-8');
      content = content.replace(/_8h/g, '');
      content = content.replace(/Files\//g, '');
      content = content.replace(/playlist__/g, '');
      content = content.replace(/__/g, '-');

      // Console.log all matches for Files/ in content
      const matches = content.match(/Files\//g);
      
      if (matches) {
        console.log('matches', matches);
      }

      await fs.writeFile(filePath, content, {encoding:'utf8',flag:'w'});
    }

    if (stats.isDirectory()) {
      const subdirFiles = await fs.readdir(filePath);

      for (const subdirFile of subdirFiles) {
        const subdirFilePath = join(filePath, subdirFile);
        const subdirStats = await fs.stat(subdirFilePath);

        if (subdirStats.isFile() && subdirFilePath.endsWith('.md')) {
          let content = await fs.readFile(subdirFilePath, 'utf-8');
          content = content.replace(/_8h/g, '');
          content = content.replace(/Files\//g, '');
          content = content.replace(/playlist__/g, '');
          content = content.replace(/__/g, '-');

          await fs.writeFile(subdirFilePath, content, {encoding:'utf8',flag:'w'});
        }
      }
    }
  }
}

// Generate sidebar-menu-links.json based on the files in content/api directory.
async function generateSidebarMenuLinks() {
  const apiDir = join(process.cwd(), 'content', 'api');
  const files = await fs.readdir(apiDir);
  const sidebarMenuLinks = [];

  for (const file of files) {
    const filePath = join(apiDir, file);
    const stats = await fs.stat(filePath);

    if (stats.isFile() && filePath.endsWith('.md')) {
      const filename = file.split('.')[0];
      const title = filename.split('__')[1] || filename;
      const url = `/api/${filename}`;
      sidebarMenuLinks.push({
        label: '',
        icon: '',
        iconClass: '',
        to: '',
        divider: true,
        links: [
          {
            label: title,
            icon: 'i-heroicons-chevron-right-20-solid',
            iconClass: '',
            to: url
          }
        ]
      });
    }


    if (stats.isDirectory()) {
      const subdirFiles = await fs.readdir(filePath);
      const header = file; // Use subdirectory name as header

      const section = {
        label: header,
        icon: 'i-heroicons-chevron-right-20-solid',
        iconClass: '',
        to: `/api/${file}`,
        divider: true,
        links: [] as any[]
      };

      for (const subdirFile of subdirFiles) {
        const subdirFilePath = join(filePath, subdirFile);
        const subdirStats = await fs.stat(subdirFilePath);

        if (subdirStats.isFile() && subdirFilePath.endsWith('.md')) {
          const filename = subdirFile.split('.')[0];

          if (filename === 'index') {
            continue;
          }

          const title = filename.split('__')[1] || filename;
          const url = `/api/${file}/${filename}`;
          section.links.push({
            label: title,
            icon: 'i-heroicons-chevron-right-20-solid',
            iconClass: '',
            to: url
          });
        }
      }

      sidebarMenuLinks.push(section);
    }
  }

  await createDirectory(join(process.cwd(), './constants'));

  await fs.writeFile(
    join(process.cwd(), './constants/sidebar-menu-links.json'),
    JSON.stringify(sidebarMenuLinks, null, 2)
  );
}

// Remove temp files.
async function cleanup() {
  const generatedDir = join(process.cwd(), '.doxybook', 'generated');
  const xmlDir = join(process.cwd(), '.doxygen', 'xml');
  const tempDir = join(process.cwd(), '.doxybook', '.temp');

  try {
    await fs.rm(generatedDir, { recursive: true, force: true });
    await fs.rm(xmlDir, { recursive: true, force: true });
    await fs.rm(tempDir, { recursive: true, force: true });
  } catch (error) {}
}

async function main() {
  await installDoxygen();
  await installDoxybook2();
  await manageDirectories();
  await generateDocs();
  await doSomeMagic();
  await fixUrls();
  await generateSidebarMenuLinks();
  await cleanup();

  console.log('Docs generated successfully.');
}

main();
