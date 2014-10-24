setInterval(function() {
  document.querySelectorAll('[class*="MuiTypography-root"]').forEach(function (el) {
    if (el.textContent.includes("Ashley Tamashiro")) {
      el.textContent = el.textContent.replace("Ashley Tamashiro", "the ex");
    }

    if (el.textContent.includes("Ash")) {
      el.textContent = el.textContent.replace("Ash", "🗑️");
    }
  })

  document.querySelectorAll('button[name="To"] > label').forEach(function (el) {
    if (el.nextSibling.textContent.includes("Ashley Tamashiro")) {
      el.nextSibling.textContent = el.nextSibling.textContent.replace("Ashley Tamashiro", "the ex");
    }
  })

  document.querySelectorAll('[id*=familyPickerLabel] > div').forEach(function (el) {
    if (el.nextSibling.textContent.includes("Ashley Tamashiro")) {
      el.nextSibling.textContent = el.nextSibling.textContent.replace("Ashley Tamashiro", "the ex");
    }
  })

  document.querySelectorAll('[id="Ashley Tamashiro"]').forEach(function (el) {
    el.textContent = "🗑️";
  })

  document.querySelectorAll('[class*="MuiAvatar-root"]').forEach(function (el) {
    el.textContent = "🗑️";
  })
}, 50);
