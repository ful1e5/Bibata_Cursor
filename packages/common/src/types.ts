// --------------------------- Types
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

export { Config };
