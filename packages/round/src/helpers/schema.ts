import fs from "fs";
import path from "path";

import { staticCursors, animatedCursors, animatedClip } from "../cursors.json";
import { schemesPath } from "../color";
import { ColorSchema, Configs } from "../types";

const generateConfigs = (
  colorSchemes: ColorSchema,
  dirPrefix: string,
  rawSvgsDir: string
) => {
  if (!fs.existsSync(rawSvgsDir)) {
    console.error("🚨🚨 Raw files not Found 🚨🚨");
    process.exit(1);
  }

  const configs: Configs = {};

  for (let [schema] of Object.entries(colorSchemes)) {
    const { base, outline, watch, customize } = colorSchemes[schema];
    const schemaName = `${dirPrefix}-${schema}`;

    const schemaSvgsPath = path.resolve(schemesPath, schemaName);
    fs.mkdirSync(schemaSvgsPath, { recursive: true });

    generateStaticSchema(rawSvgsDir, customize, base, outline, schemaSvgsPath);

    generateAnimatedSchema(rawSvgsDir, base, outline, watch, schemaSvgsPath);

    // Creating Dir for store bitmaps
    const bitmapsDir = path.resolve(process.cwd(), "bitmaps", schemaName);
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

function generateAnimatedSchema(
  rawSvgsDir: string,
  base: string,
  outline: string,
  watch:
    | {
        background: string;
        color1: string;
        color2: string;
        color3: string;
        color4: string;
      }
    | undefined,
  schemaSvgsPath: string
) {
  for (let [cursor] of Object.entries(animatedCursors)) {
    // Read file
    let content = fs
      .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
      .toString();

    // Animated Cursors have two parts:
    // 1) Cursor Color
    // 2) Watch Color
    content = content.replace("#00FF00", base).replace("#0000FF", outline);

    // try => replace `customize` colors
    // onError => replace `schema` main colors
    try {
      if (!watch) throw new Error("");
      const {
        background: b,
        color1: c1,
        color2: c2,
        color3: c3,
        color4: c4
      } = watch;
      content = content.replace("#TODO", b); //Inter watch circle
      content = content
        .replace("#TODO", c1)
        .replace("#TODO", c2)
        .replace("#TODO", c3)
        .replace("#TODO", c4);
    } catch (error) {}

    // Save Schema
    const cursorPath = path.resolve(schemaSvgsPath, cursor);
    fs.writeFileSync(cursorPath, content, "utf-8");
  }
}

function generateStaticSchema(
  rawSvgsDir: string,
  customize:
    | {
        [name: string]: {
          outline?: string | undefined;
          base?: string | undefined;
        };
      }
    | undefined,
  base: string,
  outline: string,
  schemaSvgsPath: string
) {
  staticCursors.map((cursor: string) => {
    // Read file
    let content = fs
      .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
      .toString();

    // try => replace `customize` colors
    // onError => replace `schema` main colors
    try {
      let { base: b, outline: o } = customize![cursor];
      if (!b) b = base;
      if (!o) o = outline;
      content = content.replace("#00FF00", b).replace("#0000FF", o);
    } catch (error) {
      content = content.replace("#00FF00", base).replace("#0000FF", outline);
    }

    // Save Schema
    const cursorPath = path.resolve(schemaSvgsPath, cursor);
    fs.writeFileSync(cursorPath, content, "utf-8");
  });
}
