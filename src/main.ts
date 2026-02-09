import "./styles/style.css";
import { invoke } from "@tauri-apps/api/core";

// Get elements
const greetForm = document.querySelector<HTMLFormElement>("#greet-form")!;
const greetInput = document.querySelector<HTMLInputElement>("#greet-input")!;
const greetMsg = document.querySelector<HTMLParagraphElement>("#greet-msg")!;

// Handle form submission
greetForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  greetMsg.textContent = await invoke<string>("greet", {
    name: greetInput.value,
  });
});
