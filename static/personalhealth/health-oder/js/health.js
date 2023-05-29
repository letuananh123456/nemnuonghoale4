function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

// ..collapse
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function () {
    this.classList.toggle("active1");
    var content = this.nextElementSibling;
    if (content.style.maxHeight) {
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}

  // ..collapse
var coll2 = document.getElementsByClassName("collap");
var i2;

for (i2 = 0; i2 < coll2.length; i2 ++) {
  coll2[i2].addEventListener("click", function () {
    this.classList.toggle("active");
    var content2 = this.nextElementSibling;
    if (content2.style.maxHeight) {
      content2.style.maxHeight = null;
    } else {
      content2.style.maxHeight = content2.scrollHeight + "px";
    }
  });
}