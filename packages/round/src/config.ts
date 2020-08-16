import fs from "fs";
import path from "path";

import { ColorSchema } from "./types";

// Source Directory
const rawSvgsDir = path.resolve("./src/svg/raw");

if (!fs.existsSync(rawSvgsDir)) console.error("🚨🚨 Raw files not Found 🚨🚨");

// --------------------------------------- 🌈 Cursors Variants 🌈
const colorSchemes: ColorSchema = {
  Ice: {
    base: "#ffffff",
    outline: "#000000"
  }
};

// --------------------------------------- 🔧 Render Configs 🔧

export { rawSvgsDir, colorSchemes };
