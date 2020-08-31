import { ColorSchema } from "./types";

const watchKeyColor = "#FF0000";
const baseKeyColor = "#00FF00";
const outlineKeyColor = "#0000FF";

// Common Colors
const black = "#000000";
const white = "#FFFFFF";

// Schemes Colors
// const amber = "#FF8300";
// const adwaita = "#272728";
// const breezeDark = "#4A4C49";

const colorSchemes: ColorSchema = {
  // Adwaita: {
  //   base: adwaita,
  //   outline: white
  // },
  // Amber: {
  //   base: amber,
  //   outline: white
  // },
  // Breeze: {
  //   base: breezeDark,
  //   outline: white
  // },
  // Classic: {
  //   base: black,
  //   outline: white
  // },
  Ice: {
    base: white,
    outline: black
  }
};

export { watchKeyColor, baseKeyColor, outlineKeyColor, colorSchemes };
