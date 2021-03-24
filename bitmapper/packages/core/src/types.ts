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

export { Colors };
