import { execSync } from 'child_process';
import { promises as fs } from 'fs';
import { join } from 'path';

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
  const playlistDir = join(apiDir, 'playlist');
  const generatedFilesDir = join(process.cwd(), '.doxybook', 'generated', 'Files');

  try {
    await fs.rm(apiDir, { recursive: true });
    await fs.mkdir(apiDir, { recursive: true });
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
      }

      if (filename.startsWith('playlist__')) {
        const subdirectory = filename.split('__')[0];
        const newFilename = filename.split('__')[1];
        await fs.mkdir(join(apiDir, subdirectory), { recursive: true });
        await fs.rename(filePath, join(apiDir, subdirectory, `${newFilename}.md`));
      } else {
        filename = filename.replace(/__/g, '-').replace(/_/g, '-').toLowerCase();
        await fs.rename(filePath, join(apiDir, 'projectm', `${filename}.md`));
      }
    }
  }

  const specialCases = ['playlist', 'projectM', 'projectm-eval'];

  for (const caseName of specialCases) {
    const casePath = join(apiDir, caseName === 'playlist' ? 'playlist' : 'projectm', 'index.md');
    if ((await fs.stat(casePath)).isFile()) {
      await fs.rename(casePath, join(apiDir, 'projectm', `${caseName}.md`));
    }
  }
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
  await cleanup();

  console.log('Docs generated successfully.');
}

main();
