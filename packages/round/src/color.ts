import path from "path";
import { ColorSchema } from "./types";

// --------------------------------------- Paths 🔗

const rawSvgsDir = path.resolve("svg");

// --------------------------------------- out Path 🔗

const bitmapsPath = path.resolve("bitmaps");
const schemesPath = path.resolve("schemes");

// --------------------------------------- Colors✨

const watchKeyColor = "#FF0000"; //red Key
const baseKeyColor = "#00FF00"; // green Key
const outlineKeyColor = "#0000FF"; // blue Key

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
  watchKeyColor,
  baseKeyColor,
  outlineKeyColor,
  colorSchemes
};
