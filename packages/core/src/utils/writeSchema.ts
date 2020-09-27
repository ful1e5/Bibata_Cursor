import { resolve } from "path";
import { access, mkdirSync, writeFileSync } from "fs";

interface WriteSchemaData {
  path: string;
  content: string;
  fileName: string;
}

const writeSchemaData = ({ path, content, fileName }: WriteSchemaData) => {
  access(path, (isAccessible) => {
    if (!isAccessible) {
      mkdirSync(path, { recursive: true });
    }
  });
  writeFileSync(resolve(path, fileName), content);
};

export { writeSchemaData };
