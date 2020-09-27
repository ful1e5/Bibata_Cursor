import path from "path";
import { Colors } from "../types";

export const outPaths = {
  schemes: path.resolve("schemes"),
  bitmaps: path.resolve("bitmaps")
};

export const keyColors: Colors = {
  base: "#00FF00",
  outline: "#0000FF",
  watch: {
    background: "#FF0000"
  }
};
