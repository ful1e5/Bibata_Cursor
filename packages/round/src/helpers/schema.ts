import fs from "fs";
import path from "path";

import { staticCursors, animatedCursors, animatedClip } from "../cursors.json";
import { schemesPath } from "../config";
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

    // Static .svg generation
    staticCursors.map((cursor: string) => {
      // Read file
      const cursorPath = path.resolve(schemaSvgsPath, cursor);
      let content = fs
        .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
        .toString();

      // trying to customize color if not available then main schema color
      try {
        let { base: b, outline: o } = customize![cursor];
        if (!b) b = base;
        if (!o) o = outline;
        content = content.replace("#00FF00", b).replace("#0000FF", o);
      } catch (error) {
        content = content.replace("#00FF00", base).replace("#0000FF", outline);
      }

      // Writing new svg
      fs.writeFileSync(cursorPath, content, "utf-8");
    });

    // Out Directory
    for (let [cursor] of Object.entries(animatedCursors)) {
      // Read file
      const cursorPath = path.resolve(schemaSvgsPath, cursor);
      let content = fs
        .readFileSync(path.resolve(rawSvgsDir, cursor), "utf-8")
        .toString();

      content = content.replace("#00FF00", base).replace("#0000FF", outline);
      // trying to customize color if not available then main schema color
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

      // Writing new svg
      fs.writeFileSync(cursorPath, content, "utf-8");
    }

    const bitmapsDir = path.resolve(process.cwd(), "bitmaps", schemaName);
    fs.mkdirSync(bitmapsDir, { recursive: true });

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
