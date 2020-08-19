import ora from "ora";

const spinner = ora();

spinner.color = "yellow";

spinner.spinner = { interval: 150, frames: ["📷", "📸"] };

export { spinner };
