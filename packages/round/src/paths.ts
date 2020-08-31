import { resolve } from "path";

const rawSvgsDir = resolve("svg");

const schemesPath = resolve("schemes");
const projectRoot = resolve("../../");
const bitmapsPath = resolve(projectRoot, "bitmaps");

export { rawSvgsDir, schemesPath, projectRoot, bitmapsPath };
