import { config } from "./config";

// from shared package
import { renderCursors } from "shared";

console.log("Bibata Round");

(async () => {
  renderCursors(config);
})();
