import { promises as fs, existsSync, readdirSync, statSync } from "fs";
import path from "path";

// Create directory if doesnt exist.
async function createDirectory(dirPath: string, rm: boolean = false) {
    if (existsSync(dirPath) && rm) {
        await fs.rm(dirPath, { recursive: true });
    }

    await fs.mkdir(dirPath, { recursive: true });
}

// Copy directory recursively
async function copyDirectory(source: string, target: string) {
    await createDirectory(target, true);

    const items = readdirSync(source);

    for (const item of items) {
        const sourcePath = path.join(source, item);
        const targetPath = path.join(target, item);
        const stats = statSync(sourcePath);

        if (stats.isDirectory()) {
            await copyDirectory(sourcePath, targetPath);
        } else {
            await fs.copyFile(sourcePath, targetPath);
        }
    }
}

// Prepare docs in ./public directory
async function prepareDocs() {
    await createDirectory("./public");

    await copyDirectory("./content", "./.output/public/content");
    await copyDirectory("./generated", "./.output/public/generated");
    await copyDirectory("./pages", "./.output/public/pages");

    await fs.copyFile("./constants/config.json", "./.output/public/config.json");
}

prepareDocs();
