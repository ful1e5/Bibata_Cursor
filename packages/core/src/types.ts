interface Frames {
  [fileName: string]: {
    buffer: Buffer;
  };
}

type Colors = {
  base: string;
  outline: string;
  watch?: {
    background: string;
  };
};

interface ThemeColors {
  [themeName: string]: Colors;
}

interface PixelDiffRate {
  [name: string]: {
    rate: number;
  };
}

export { Frames, Colors, ThemeColors, PixelDiffRate };
