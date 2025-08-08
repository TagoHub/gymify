// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

window.showToast = function(message, options = {}) {
  const {
    type = "dark",
    delay = 3000,
    icon = ""
  } = options;

  const container = document.getElementById("toast-container");
  if (!container) return;

  const toastId = `toast-${Date.now()}`;

  const toastEl = document.createElement("div");
  toastEl.className = `toast align-items-center text-white bg-${type} border-0 mb-2`;
  toastEl.setAttribute("role", "alert");
  toastEl.setAttribute("aria-live", "assertive");
  toastEl.setAttribute("aria-atomic", "true");
  toastEl.id = toastId;

  toastEl.innerHTML = `
    <div class="d-flex">
      <div class="toast-body">
        ${icon ? icon + " " : ""}${message}
      </div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  `;

  container.appendChild(toastEl);

  const toast = new bootstrap.Toast(toastEl, { delay });
  toast.show();

  toastEl.addEventListener("hidden.bs.toast", () => {
    toastEl.remove();
  });
}

window.playSound = function () {
  fetch('/assets/notification.mp3')
    .then(response => response.arrayBuffer())
    .then(arrayBuffer => {
      const audioContext = new (window.AudioContext || window.webkitAudioContext)();
      if (audioContext.state === 'suspended') {
        audioContext.resume();
      }
      return audioContext.decodeAudioData(arrayBuffer).then(buffer => {
        const source = audioContext.createBufferSource();
        source.buffer = buffer;
        source.connect(audioContext.destination);
        source.start(0);
      });
    })
    .catch((e) => console.error("Audio failed to play:", e));
};