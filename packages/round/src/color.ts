import path from "path";

import { ColorSchema } from "./types";

// --------------------------------------- Paths 🔗

const rawSvgsDir = path.resolve("src", "svg", "raw");
const schemesPath = path.resolve("src", "svg");

// --------------------------------------- Colors✨

const black = "#000000";
const white = "#FFFFFF";

// --------------------------------------- Schemes🌈

const colorSchemes: ColorSchema = {
  Ice: {
    base: black,
    outline: white,
    watch: {
      background: white
    }
  },
  Classic: {
    base: black,
    outline: white,
    watch: {
      background: black
    }
  }
};

export { rawSvgsDir, schemesPath, colorSchemes };
