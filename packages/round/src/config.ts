import fs from "fs";
import path from "path";
import rimraf from "rimraf";

import { staticCursors, animatedCursors, animatedClip } from "./cursors.json";
import { ColorSchemas } from "./types";

// Source Directory
export const rawSvgsDir = path.resolve("./src/svg/raw");
if (!fs.existsSync(rawSvgsDir))
  console.error("🚨🚨 Source files not Found 🚨🚨");

// --------------------------------------- 🌈 Cursors Variants 🌈

const colorSchemes: ColorSchemas = {
  Ice: {
    base: "#ffffff",
    outline: "#000000"
  }
};

// --------------------------------------- 🔧 Render Configs 🔧
const configs: any = [];

for (let [schema] of Object.entries(colorSchemes)) {
  const { base, outline } = colorSchemes[schema];
  const schemaName = `Bibata_${schema}`;

  const schemaSvgsPath = path.resolve("./src/svg", schemaName);

  if (fs.existsSync(schemaSvgsPath)) rimraf(schemaSvgsPath, function () {});
  fs.mkdirSync(schemaSvgsPath);

  // Resolve Paths for svg
  const staticSvgs = staticCursors.map((svgFile: string) => {
    // Read file
    const filePath = path.resolve(schemaSvgsPath, svgFile);

    // Replacing colorSchema
    let content = fs
      .readFileSync(path.resolve(rawSvgsDir, svgFile), "utf-8")
      .toString();

    content = content
      .replace("black", base)
      .replace("white", outline)
      .replace("#000000", base)
      .replace("#ffffff", outline);

    // Writing new svg
    fs.writeFileSync(filePath, content, "utf-8");

    return filePath;
  });

  // Out Directory
  const bitmapsDir = path.resolve(process.cwd(), "bitmaps", `Bibata_${schema}`);
  if (!fs.existsSync(bitmapsDir)) fs.mkdirSync(bitmapsDir);

  configs.push({
    svgDir: schemaSvgsPath,
    staticSvgs,
    bitmapsDir,
    animatedCursors,
    animatedClip
  });
}

export { configs };
