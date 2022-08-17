export const exitWithError = (msg: string) => {
  console.error(msg);
  process.exit(1);
};
