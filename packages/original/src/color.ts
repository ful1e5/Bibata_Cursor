import { ColorSchemes } from "bibata-core/src/types";

// Common Colors
const black = "#000000";
const white = "#FFFFFF";
const amber = "#FF8300";

const colorSchemes: ColorSchemes = {
  Amber: {
    base: amber,
    outline: white,
    watch: {
      background: white
    }
  },
  Classic: {
    base: black,
    outline: white
  },
  Ice: {
    base: white,
    outline: black
  }
};

export { colorSchemes };
