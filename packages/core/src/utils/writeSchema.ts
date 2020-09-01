import { resolve } from "path";
import { exists, mkdirSync, writeFileSync } from "fs";

interface WriteSchemaData {
  path: string;
  content: string;
  fileName: string;
}

const writeSchemaData = ({ path, content, fileName }: WriteSchemaData) => {
  exists(path, (exists) => {
    if (!exists) {
      mkdirSync(path, { recursive: true });
    }
  });
  writeFileSync(resolve(path, fileName), content);
};

export { writeSchemaData };
