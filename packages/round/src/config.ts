import fs from "fs";
import path from "path";

import { ColorSchema } from "./types";

// Source Directory
const rawSvgsDir = path.resolve("./src/svg/raw");

if (!fs.existsSync(rawSvgsDir)) console.error("🚨🚨 Raw files not Found 🚨🚨");

// --------------------------------------- 🌈 Cursors Variants 🌈
const schemesPath = path.resolve("./src/svg");
const colorSchemes: ColorSchema = {
  Ice: {
    base: "#FFFFFF",
    outline: "#000000"
  },
  Classic: {
    base: "#000000",
    outline: "#FFFFFF"
  }
};

// --------------------------------------- 🔧 Render Configs 🔧

export { rawSvgsDir, schemesPath, colorSchemes };
