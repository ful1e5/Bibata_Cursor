import path from "path";

import { ColorSchema } from "./types";

// --------------------------------------- Paths 🔗

const rawSvgsDir = path.resolve("src", "svg", "raw");
const schemesPath = path.resolve("src", "svg");

// --------------------------------------- Colors✨

const black = "#000000";
const white = "#FFFFFF";
const red = "#F2704D";
const yellow = "#FDC43F";
const green = "#96C865";
const blue = "#4FADDF";

const watchColors = {
  color1: red, // top-right shape color
  color2: yellow, // bottom-right shape color
  color3: green, // bottom-left shape color
  color4: blue // top-left shape color
};

// --------------------------------------- Schemes🌈
const colorSchemes: ColorSchema = {
  Ice: {
    base: black,
    outline: white,
    watch: {
      background: white,
      ...watchColors
    }
  },
  Classic: {
    base: black,
    outline: white,
    watch: {
      background: black,
      ...watchColors
    }
  }
};

export { rawSvgsDir, schemesPath, colorSchemes };
