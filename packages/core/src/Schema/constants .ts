import path from "path";
import { KeyColors } from "../types";

export const outPaths = {
  schemes: path.resolve("schemes"),
  bitmaps: path.resolve("bitmaps")
};

export const keyColors: KeyColors = {
  watch: "#FF0000",
  base: "#00FF00",
  outline: "#0000FF"
};
