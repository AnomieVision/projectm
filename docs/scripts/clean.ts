import { promises as fs, existsSync } from "fs";
import { exec } from "child_process";

// Directories to clean
const directories: string[] = [
  "dist",
  ".nuxt",
  ".output",
  "node_modules/.cache",
  "node_modules/.vite",
];

// Files to clean
const files: string[] = [];

async function clean() {
  // Clean directories
  for (const dir of directories) {
    if (existsSync(dir)) {
      await fs.rm(dir, { recursive: true });
      console.log(`Cleaning ${dir} directory...`);
    }
  }

  // Clean files
  for (const file of files) {
    if (existsSync(file)) {
      await fs.rm(file);
      console.log(`Cleaning ${file} file...`);
    }
  }
}

// Run script
async function main() {
  await clean();

  // Run npm install
  exec("npm install", (err, stdout, _stderr) => {
    if (err) {
      console.error(err);
      return;
    }

    console.log(stdout);
  });
}

main();
