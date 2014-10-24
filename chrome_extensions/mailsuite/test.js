document.querySelectorAll('span[class="date-info"]').forEach( function(str) {
  var dateStr = str.textContent.split("Last open on ")[1].replace(' at', ',');
  var dateObj = new Date(dateStr);
  var newDateObj = new Date;
  var string = str;
  minsElapsed = (newDateObj - dateObj) / 1000.0 / 60;
  if (minsElapsed < 30)  {
    str.style.border = "1px solid #89b664";
    str.style.fontWeight = "bold";
    str.style.color = "#89b664";
    str.style.borderRadius = "5px";
    str.style.background = "#89b66422";
    str.style.padding = "0 4px";
  }
})

document.querySelectorAll('div[class="recipient"]').forEach( function(str) {
  if (str.textContent.includes("Ash")) {
    str.textContent = "🥯🥯🥯";
  }
})
