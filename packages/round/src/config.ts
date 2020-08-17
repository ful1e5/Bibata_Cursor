import path from "path";

import { ColorSchema } from "./types";

// --------------------------------------- Paths

const rawSvgsDir = path.resolve("src", "svg", "raw");
const schemesPath = path.resolve("src", "svg");

// --------------------------------------- Colors✨

const black = "#000000";
const white = "#FFFFFF";
const red = "#F2704D";
const yellow = "#FDC43F";
const green = "#96C865";
const blue = "#4FADDF";

// --------------------------------------- Schemes🌈

const colorSchemes: ColorSchema = {
  Ice: {
    base: black,
    outline: white,
    watch: {
      background: black,
      color1: red,
      color2: yellow,
      color3: green,
      color4: blue
    },
    customize: {
      "top_left_corner.svg": {},
      "top_right_corner.svg": {},
      "bottom_left_corner.svg": {},
      "bottom_right_corner.svg": {}
    }
  },
  Classic: {
    base: black,
    outline: white
  }
};

export { rawSvgsDir, schemesPath, colorSchemes };
