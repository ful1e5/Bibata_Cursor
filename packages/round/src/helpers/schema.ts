import fs from "fs";
import path from "path";

import { staticCursors, animatedCursors, animatedClip } from "../cursors.json";
import {
  schemesPath,
  bitmapsPath,
  baseKeyColor,
  outlineKeyColor,
  rawSvgsDir
} from "../color";
import { ColorSchema, Configs } from "../types";

// --------------------------------------- Generate Configs 🛠

const generateConfigs = (colorSchemes: ColorSchema, dirPrefix: string) => {
  if (!fs.existsSync(rawSvgsDir)) {
    console.error(`🚨 .svg files not found in ${rawSvgsDir}`);
    process.exit(1);
  }

  const configs: Configs = {};

  for (let [schema] of Object.entries(colorSchemes)) {
    const schemaName = `${dirPrefix}-${schema}`;

    const schemaSvgsPath = path.resolve(schemesPath, schemaName);
    fs.mkdirSync(schemaSvgsPath, { recursive: true });

    const { base, outline, watch } = colorSchemes[schema];
    staticCursors.map((cursor: string) => {
      // Read file
      let content = fs
        .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
        .toString();

      content = content
        .replace(baseKeyColor, base)
        .replace(outlineKeyColor, outline);

      // Save Schema
      const cursorPath = path.resolve(schemaSvgsPath, cursor);
      fs.writeFileSync(cursorPath, content, "utf-8");
    });

    for (let [cursor] of Object.entries(animatedCursors)) {
      // Read file
      let content = fs
        .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
        .toString();

      // Animated Cursors have two parts:
      // 1) Cursor Color
      // 2) Watch Color

      content = content
        .replace(baseKeyColor, base)
        .replace(outlineKeyColor, outline);

      // try => replace `customize` colors
      // onError => replace `schema` main colors
      try {
        if (!watch) throw new Error("");
        const { background: b } = watch;
        content = content.replace("#TODO", b); // Watch Background
      } catch (error) {}

      // Save Schema
      const cursorPath = path.resolve(schemaSvgsPath, cursor);
      fs.writeFileSync(cursorPath, content, "utf-8");
    }

    // Creating Dir for store bitmaps
    const bitmapsDir = path.resolve(bitmapsPath, schemaName);
    fs.mkdirSync(bitmapsDir, { recursive: true });

    // push config to Object
    configs[schema] = {
      svgsDir: schemaSvgsPath,
      bitmapsDir,
      animatedCursors,
      staticCursors,
      animatedClip
    };
  }

  return configs;
};

export { generateConfigs };
