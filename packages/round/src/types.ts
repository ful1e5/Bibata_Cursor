interface ColorSchema {
  [name: string]: {
    base: string;
    outline: string;
    watch?: {
      background: string;
      color1: string;
      color2: string;
      color3: string;
      color4: string;
    };
  };
}

type AnimatedCursors = {
  readonly [name: string]: {
    readonly frames: number;
  };
};

type AnimatedClip = {
  readonly x: number;
  readonly y: number;
  readonly width: number;
  readonly height: number;
};

interface Config {
  staticCursors: Array<string>;
  bitmapsDir: string;
  svgsDir: string;
  animatedCursors: AnimatedCursors;
  animatedClip: AnimatedClip;
}

interface Configs {
  [name: string]: Config;
}

export { ColorSchema, Config, Configs };
