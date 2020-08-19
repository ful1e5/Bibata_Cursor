import path from "path";
import { ColorSchema } from "./types";

// --------------------------------------- Bitmaps/out Path 🔗

const bitmapsPath = path.resolve("bitmaps");

// --------------------------------------- Paths 🔗

const rawSvgsDir = path.resolve("svg");
const schemesPath = path.resolve("schemes");

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

export { rawSvgsDir, bitmapsPath, schemesPath, colorSchemes };
