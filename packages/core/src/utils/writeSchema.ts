import { exists, mkdir, writeFile } from "fs";

const writeSchemaData = (location: string, content: string) => {
  exists(location, (exists) => {
    if (!exists) {
      mkdir(location, { recursive: true }, () => {});
    }
  });
  writeFile(location, content, "utf-8", () => {
    throw new Error(`Oops Something went wrong with Schema Generator`);
  });
};

export { writeSchemaData };
