import { exists, mkdir, writeFile } from "fs";

const writeSchemaData = (location: string, content: string) => {
  exists(location, (exists) => {
    if (!exists) {
      mkdir(location, { recursive: true }, () => {});
    }
  });
  writeFile(location, content, "utf-8", () => {});
};

export { writeSchemaData };
