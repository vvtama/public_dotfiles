setInterval(function() {
  document.querySelectorAll('div[class="gs"] div[dir="auto"]').forEach(function (el) {
    if (el.textContent.includes("Ash")) {
      el.textContent = el.textContent.replaceAll("Ash", "🥯🥯🥯");
    };
    if (el.textContent.includes("Ashley")) {
      el.textContent = el.textContent.replaceAll("Ashley", "🥯🥯🥯");
    };
  })
}, 50);
