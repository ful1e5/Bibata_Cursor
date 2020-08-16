import fs from "fs";
import path from "path";
import rimraf from "rimraf";

import { staticCursors, animatedCursors, animatedClip } from "../cursors.json";
import { schemesPath } from "../config";
import { ColorSchema, Configs } from "../types";

const generateConfigs = (
  colorSchemes: ColorSchema,
  dirPrefix: string,
  rawSvgsDir: string
) => {
  const configs: Configs = {};

  for (let [schema] of Object.entries(colorSchemes)) {
    const { base, outline, watchBackground } = colorSchemes[schema];
    const schemaName = `${dirPrefix} ${schema}`;

    const schemaSvgsPath = path.resolve(schemesPath, schemaName);

    if (fs.existsSync(schemaSvgsPath)) {
      rimraf(schemaSvgsPath, function () {});
      fs.mkdirSync(schemaSvgsPath, { recursive: true });
    } else {
      fs.mkdirSync(schemaSvgsPath, { recursive: true });
    }

    // Static .svg generation
    staticCursors.map((cursor: string) => {
      // Read file
      const cursorPath = path.resolve(schemaSvgsPath, cursor);

      // Replacing colorSchema
      let content = fs
        .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
        .toString();

      content = content.replace("#00FF00", base).replace("#0000FF", outline);

      // Writing new svg
      fs.writeFileSync(cursorPath, content, "utf-8");
    });

    // Out Directory
    for (let [cursor] of Object.entries(animatedCursors)) {
      // Read file
      const cursorPath = path.resolve(schemaSvgsPath, cursor);

      // Replacing colorSchema
      let content = fs
        .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
        .toString();

      content = content.replace("#00FF00", watchBackground);

      // Writing new svg
      fs.writeFileSync(cursorPath, content, "utf-8");
    }

    const bitmapsDir = path.resolve(process.cwd(), "bitmaps", schemaName);
    if (fs.existsSync(bitmapsDir)) {
      rimraf(bitmapsDir, function () {});
      fs.mkdirSync(bitmapsDir, { recursive: true });
    } else {
      fs.mkdirSync(bitmapsDir, { recursive: true });
    }

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
