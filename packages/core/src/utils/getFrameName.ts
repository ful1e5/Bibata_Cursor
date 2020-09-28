export const frameNumber = (index: number, endIndex: number) => {
  let result = "" + index;
  while (result.length < endIndex) {
    result = "0" + result;
  }
  return result;
};

export const getFrameName = (index: number, fileName: string) => {
  const frame = frameNumber(index, 3);
  return `${fileName}-${frame}.png`;
};
