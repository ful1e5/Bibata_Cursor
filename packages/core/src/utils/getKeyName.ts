import path from "path";

export const frameNumber = (index: number, endIndex: number) => {
  let result = "" + index;
  while (result.length < endIndex) {
    result = "0" + result;
  }
  return result;
};

export const getKeyName = (index: number, fileName: string) => {
  const frame = frameNumber(index, 3);
  return `${path.basename(fileName, ".svg")}-${frame}.png`;
};
