import fs from "fs";
import ora from "ora";
import chalk from "chalk";
import path from "path";

import { ColorSchemes, Config, PathConfig } from "./types";
import { writeSchemaData } from "./utils/writeSchema";

export interface GenerateConfigsArgs {
  pathConfig: PathConfig;
  colorSchemes: ColorSchemes;
  themeName: string;
}

// --------------------------------------- Key Colors Configs 🛠 (Colors for replacement)

const watchKeyColor = "#FF0000";
const baseKeyColor = "#00FF00";
const outlineKeyColor = "#0000FF";

const generateConfigs = ({
  pathConfig,
  colorSchemes,
  themeName
}: GenerateConfigsArgs) => {
  const {
    rawSvgsDir,
    schemesPath,
    bitmapsPath,
    animatedCursors,
    staticCursors
  } = pathConfig;

  if (!fs.existsSync(rawSvgsDir)) {
    console.error(`🚨 .svg files not found in ${rawSvgsDir}`);
    process.exit(1);
  }

  const configs: Record<string, Config> = {};

  for (let [schema] of Object.entries(colorSchemes)) {
    const schemaName = `${themeName}-${schema}`;

    const spinner = ora();
    spinner.text = ` Generating ${chalk.blueBright(schemaName)} Color Schema`;

    const schemaSvgsPath = path.resolve(schemesPath, schemaName);
    fs.mkdirSync(schemaSvgsPath, { recursive: true });

    const { base, outline, watch } = colorSchemes[schema];

    try {
      const sCursors = staticCursors.map((cursor: string) => {
        // Read file
        let content = fs.readFileSync(cursor, "utf-8").toString();

        content = content
          .replace(new RegExp(baseKeyColor, "g"), base)
          .replace(new RegExp(outlineKeyColor, "g"), outline);

        // Save Schema
        cursor = path.basename(cursor);
        writeSchemaData({
          path: schemaSvgsPath,
          fileName: cursor,
          content
        });

        return path.resolve(schemaSvgsPath, cursor);
      });

      const aCursors = animatedCursors.map((cursor: string) => {
        // Read file
        let content = fs
          .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
          .toString();

        // Animated Cursors have two parts:
        // 1) Cursor Color
        // 2) Watch Color

        content = content
          .replace(new RegExp(baseKeyColor, "g"), base)
          .replace(new RegExp(outlineKeyColor, "g"), outline);

        // try => replace `customize` colors
        // onError => replace `schema` main colors
        try {
          if (!watch) throw new Error("");
          const { background: b } = watch;
          content = content.replace(new RegExp(watchKeyColor, "g"), b); // Watch Background
        } catch (error) {
          content = content.replace(new RegExp(watchKeyColor, "g"), base); // on error=> replace as base
        }

        // Save Schema
        cursor = path.basename(cursor);
        writeSchemaData({
          path: schemaSvgsPath,
          fileName: cursor,
          content
        });

        return path.resolve(schemaSvgsPath, cursor);
      });

      // Creating Dir for store bitmaps
      const bitmapsDir = path.resolve(bitmapsPath, schemaName);
      fs.mkdirSync(bitmapsDir, { recursive: true });

      // push config to Object
      configs[schemaName] = {
        bitmapsDir,
        animatedCursors: aCursors,
        staticCursors: sCursors
      };
      spinner.succeed();
    } catch (error) {
      console.log(error);
      spinner.fail();
    }
  }

  return configs;
};

export { generateConfigs };
