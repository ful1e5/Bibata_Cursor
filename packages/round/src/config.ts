import fs from "fs";
import path from "path";

import { generateConfigs } from "./helpers/schema";
import { ColorSchemas } from "./types";

// Source Directory
const rawSvgsDir = path.resolve("./src/svg/raw");

if (!fs.existsSync(rawSvgsDir)) console.error("🚨🚨 Raw files not Found 🚨🚨");

// --------------------------------------- 🌈 Cursors Variants 🌈

const colorSchemes: ColorSchemas = {
  Ice: {
    base: "#ffffff",
    outline: "#000000"
  }
};

// --------------------------------------- 🔧 Render Configs 🔧
const configs = generateConfigs(colorSchemes);

export { rawSvgsDir, configs };
