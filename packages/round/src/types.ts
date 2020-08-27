import { Config } from "common/src/types";

interface ColorSchema {
  [name: string]: {
    base: string;
    outline: string;
    watch?: {
      background: string;
    };
  };
}

export { ColorSchema, Config };
