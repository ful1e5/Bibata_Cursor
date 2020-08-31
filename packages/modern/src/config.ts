import { resolve } from "path";
import { readdirSync } from "fs";

const rawSvgsDir = resolve("./src/svg");
const staticCursorsDir = resolve(rawSvgsDir, "static");
const animatedCursorsDir = resolve(rawSvgsDir, "animated");

const staticCursors = readdirSync(staticCursorsDir).map((f) =>
  resolve(staticCursorsDir, f)
);

const animatedCursors = readdirSync(animatedCursorsDir).map((f) =>
  resolve(animatedCursorsDir, f)
);

const schemesPath = resolve("schemes");
const projectRoot = resolve("../../");
const bitmapsPath = resolve(projectRoot, "bitmaps");

export {
  rawSvgsDir,
  schemesPath,
  projectRoot,
  bitmapsPath,
  staticCursors,
  animatedCursors
};
