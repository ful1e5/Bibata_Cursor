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
const amber = "#FF8300";
const white = "#FFFFFF";

// --------------------------------------- Schemes🌈

const colorSchemes: ColorSchema = {
  Ice: {
    base: white,
    outline: black
  },
  Classic: {
    base: black,
    outline: white
  },
  Amber: {
    base: amber,
    outline: white
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
