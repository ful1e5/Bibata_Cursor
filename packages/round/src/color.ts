import path from "path";
import { ColorSchema } from "./types";

// --------------------------------------- Bitmaps/out Path 🔗

const bitmapsPath = path.resolve("bitmaps");

// --------------------------------------- Paths 🔗

const rawSvgsDir = path.resolve("svg");
const schemesPath = path.resolve("schemes");

// --------------------------------------- Colors✨
const baseKeyColor = /#00FF00/g; // green Key
const outlineKeyColor = /#0000FF/g; // blue Key

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

export {
  rawSvgsDir,
  bitmapsPath,
  schemesPath,
  baseKeyColor,
  outlineKeyColor,
  colorSchemes
};
