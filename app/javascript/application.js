// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "tom-select"

document.addEventListener("DOMContentLoaded", () => {
  const selectEl = document.querySelector("#exercise-select");
  if (selectEl) {
    new window.TomSelect(selectEl, {
      plugins: ['remove_button'],
      maxItems: null,
      searchField: "text"
    });
  }
});

window.showToast = function(message, options = {}) {
  if (!message) return;
  const {
    type = "light",
    delay = 4000,
    icon = ""
  } = options;

  const container = document.getElementById("toast-container");
  if (!container) return;

  const toastId = `toast-${Date.now()}`;

  const toastEl = document.createElement("div");
  toastEl.className = `toast align-items-center text-black bg-${type} bg-opacity-75 border-0 mb-2`;
  toastEl.setAttribute("role", "alert");
  toastEl.setAttribute("aria-live", "assertive");
  toastEl.setAttribute("aria-atomic", "true");
  toastEl.id = toastId;

  toastEl.innerHTML = `
    <div class="d-flex">
      <div class="toast-body">
        ${icon ? icon + "&nbsp;" + "&nbsp;" : ""}${message}
      </div>
      <button type="button" class="btn-close btn-close-black me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
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

document.addEventListener("DOMContentLoaded", () => {
  document.body.addEventListener("click", (event) => {
    const el = event.target.closest("[data-confirm]");
    if (el) {
      const message = el.getAttribute("data-confirm");
      if (!confirm(message)) {
        event.preventDefault();
      }
    }
  });
});