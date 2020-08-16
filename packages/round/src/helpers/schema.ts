import fs from "fs";
import path from "path";
import rimraf from "rimraf";

import { staticCursors, animatedCursors, animatedClip } from "../cursors.json";
import { ColorSchema } from "../types";

const generateConfigs = (
  colorSchemes: ColorSchema,
  dirPrefix: string,
  rawSvgsDir: string
) => {
  const configs: any = [];

  for (let [schema] of Object.entries(colorSchemes)) {
    const { base, outline } = colorSchemes[schema];
    const schemaName = `${dirPrefix} ${schema}`;

    const schemaSvgsPath = path.resolve("./src/svg", schemaName);

    try {
      if (fs.existsSync(schemaSvgsPath)) {
        rimraf(schemaSvgsPath, function () {});
      } else {
        fs.mkdirSync(schemaSvgsPath);
      }

      // Static .svg generation
      const staticSvgs = staticCursors.map((svgFile: string) => {
        // Read file
        const filePath = path.resolve(schemaSvgsPath, svgFile);

        // Replacing colorSchema
        let content = fs
          .readFileSync(path.resolve(rawSvgsDir, svgFile), "utf-8")
          .toString();

        content = content.replace("#00FF00", base).replace("#0000FF", outline);

        // Writing new svg
        fs.writeFileSync(filePath, content, "utf-8");

        return filePath;
      });

      // Out Directory
      const bitmapsDir = path.resolve(
        process.cwd(),
        "bitmaps",
        `Bibata_${schema}`
      );
      if (!fs.existsSync(bitmapsDir)) fs.mkdirSync(bitmapsDir);

      configs.push({
        svgDir: schemaSvgsPath,
        staticSvgs,
        bitmapsDir,
        animatedCursors,
        animatedClip
      });
    } catch (error) {
      console.error("An error occurred in .svg files generation.");
    }
  }

  return configs;
};

export { generateConfigs };
