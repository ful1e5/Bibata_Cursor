/**
 * Hex Colors in string Format.
 *
 * `Example: `"#FFFFFF"
 */
type HexColor = string;

/**
 * @Colors expect `base`, `outline` & `watch-background` colors in **HexColor** Format.
 * @default background is `base` color.
 */
type Colors = {
  base: HexColor;
  outline: HexColor;
  watch?: {
    background: HexColor;
  };
};

/**
 * Default Key Colors for generating colored svg.
 * base="#00FF00" (Green)
 * outline="#0000FF" (Blue)
 * watch.background="#FF0000" (Red)
 * */
const defaultKeyColors: Colors = {
  base: "#00FF00",
  outline: "#0000FF",
  watch: {
    background: "#FF0000",
  },
};

/**
 * Customize colors of svg code.
 * @param {string} content SVG code.
 * @param {Colors} colors Customize colors.
 * @param {Colors} [keys] Colors Key, That was written SVG code.
 * @returns {string} SVG code with colors.
 */
const colorSvg = (
  content: string,
  colors: Colors,
  keys: Colors = defaultKeyColors
): string => {
  content = content
    .replace(new RegExp(keys.base, "ig"), colors.base)
    .replace(new RegExp(keys.outline, "ig"), colors.outline);

  try {
    // === trying to replace `watch` color ===

    if (!colors.watch?.background) {
      throw new Error("");
    }
    const { background: b } = colors.watch;
    content = content.replace(new RegExp(keys.watch!.background, "ig"), b); // Watch Background
  } catch (error) {
    // === on error => replace `watch` color as `base` ===

    content = content.replace(
      new RegExp(keys.watch!.background, "ig"),
      colors.base
    );
  }
  return content;
};

export { Colors, colorSvg };
