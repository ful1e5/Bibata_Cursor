import path from "path";
import fs from "fs";
import { staticCursors, animatedCursors, animatedClip } from "./cursors.json";

// --------------------------------------- 🌈 Cursors Variants 🌈

export const colorSchemes = {
  ice: {
    base: "#ffffff",
    outline: "#000000"
  }
};

// --------------------------------------- 🔧 Cursors Config 🔧

// Source Directory
const svgsDir = path.resolve("./src/svg");

// Resolve Paths for svg
const staticSvgs = staticCursors.map((svg: string) =>
  path.resolve(svgsDir, svg)
);

// Out Directory
const bitmapsDir = path.resolve(process.cwd(), "bitmaps");
if (!fs.existsSync(bitmapsDir)) fs.mkdirSync(bitmapsDir);

export const config = {
  animatedCursors,
  animatedClip,
  staticSvgs,
  bitmapsDir,
  svgsDir
};
