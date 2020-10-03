interface Frames {
  [fileName: string]: {
    buffer: Buffer;
  };
}

/**
 * Hex Colors in string Formate.
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
 * Colors object for this cursors theme.
 *
 * @example
 * ```typescript
 * const themeColors: ThemeColors = {
 *   White:{
 *     base: "#FFFFFF",
 *     outline: "#000000"
 *   },
 * };
 * ```
 */
interface ThemeColors {
  [themeName: string]: Colors;
}

export { Frames, Colors, ThemeColors };
