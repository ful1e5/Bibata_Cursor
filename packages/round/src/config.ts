import path from "path";
import fs from "fs";
import { staticCursors, animatedCursors, animatedClip } from "./cursors.json";

// Source Directory
const svgsDir = path.resolve(__dirname, "svg");

// Resolve Paths for svg
const staticSvgs = staticCursors.map((svg: string) =>
  path.resolve(svgsDir, svg)
);

// Out Directory
const bitmapsDir = path.resolve(process.cwd(), "bitmaps");
if (!fs.existsSync(bitmapsDir)) fs.mkdirSync(bitmapsDir);

export { staticSvgs, animatedCursors, svgsDir, bitmapsDir, animatedClip };
