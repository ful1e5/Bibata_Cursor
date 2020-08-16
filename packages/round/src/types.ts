interface ColorSchema {
  [name: string]: {
    base: string;
    outline: string;
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
  staticSvgs: Array<string> | undefined;
  bitmapsDir: string;
  svgsDir: string;
  animatedCursors: AnimatedCursors | undefined;
  animatedClip: AnimatedClip;
}

interface Configs {
  [name: string]: Config;
}

export { ColorSchema, Config, Configs };
