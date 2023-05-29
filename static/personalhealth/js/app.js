var wrapper = document.getElementById("signature-pad");
var wrapper1 = document.getElementById("signature-pad1");

var clearButton = wrapper.querySelector("[data-action=clear]");
var changeColorButton = wrapper.querySelector("[data-action=change-color]");
var undoButton = wrapper.querySelector("[data-action=undo]");
var savePNGButton = wrapper.querySelector("[data-action=save-png]");
var downloadPng = wrapper.querySelector("[data-action=download]");
var canvas = wrapper.querySelector("canvas");

var clearButton1 = wrapper1.querySelector("[data-action=clear]");
var changeColorButton1 = wrapper1.querySelector("[data-action=change-color]");
var undoButton1 = wrapper1.querySelector("[data-action=undo]");
var savePNGButton1 = wrapper1.querySelector("[data-action=save-png]");
var downloadPng1 = wrapper1.querySelector("[data-action=download]");

var canvas1 = wrapper1.querySelector("canvas");
var signaturePad = new SignaturePad(canvas, {
  // It's Necessary to use an opaque color when saving image as JPEG;
  // this option can be omitted if only saving as PNG or SVG
  backgroundColor: 'rgb(255, 255, 255)'
});
var signaturePad1 = new SignaturePad(canvas1, {
  // It's Necessary to use an opaque color when saving image as JPEG;
  // this option can be omitted if only saving as PNG or SVG
  backgroundColor: 'rgb(255, 255, 255)'
});

// Adjust canvas coordinate space taking into account pixel ratio,
// to make it look crisp on mobile devices.
// This also causes canvas to be cleared.
function resizeCanvas() {
  // When zoomed out to less than 100%, for some very strange reason,
  // some browsers report devicePixelRatio as less than 1
  // and only part of the canvas is cleared then.
  var ratio =  Math.max(window.devicePixelRatio || 1, 1);

  // This part causes the canvas to be cleared
  canvas.width = canvas.offsetWidth * ratio;
  canvas.height = canvas.offsetHeight * ratio;
  canvas.getContext("2d").scale(ratio, ratio);
  // This part causes the canvas to be cleared
  canvas1.width = canvas1.offsetWidth * ratio;
  canvas1.height = canvas1.offsetHeight * ratio;
  canvas1.getContext("2d").scale(ratio, ratio);

  // This library does not listen for canvas changes, so after the canvas is automatically
  // cleared by the browser, SignaturePad#isEmpty might still return false, even though the
  // canvas looks empty, because the internal data of this library wasn't cleared. To make sure
  // that the state of this library is consistent with visual state of the canvas, you
  // have to clear it manually.
  signaturePad.clear();
  signaturePad1.clear();

}


// On mobile devices it might make more sense to listen to orientation change,
// rather than window resize events.
window.onresize = resizeCanvas;
resizeCanvas();

function download(dataURL, filename) {
  if (navigator.userAgent.indexOf("Safari") > -1 && navigator.userAgent.indexOf("Chrome") === -1) {
    window.open(dataURL);
  } else {
    var blob = dataURLToBlob(dataURL);
    var url = window.URL.createObjectURL(blob);

    var a = document.createElement("a");
    a.style = "display: none";
    a.href = url;
    a.download = filename;

    document.body.appendChild(a);
    a.click();

    window.URL.revokeObjectURL(url);
  }
}

// One could simply use Canvas#toBlob method instead, but it's just to show
// that it can be done using result of SignaturePad#toDataURL.
function dataURLToBlob(dataURL) {
  // Code taken from https://github.com/ebidel/filer.js
  var parts = dataURL.split(';base64,');
  var contentType = parts[0].split(":")[1];
  var raw = window.atob(parts[1]);
  var rawLength = raw.length;
  var uInt8Array = new Uint8Array(rawLength);

  for (var i = 0; i < rawLength; ++i) {
    uInt8Array[i] = raw.charCodeAt(i);
  }

  return new Blob([uInt8Array], { type: contentType });
}

clearButton.addEventListener("click", function (event) {
  signaturePad.clear();
});
clearButton1.addEventListener("click", function (event) {
  signaturePad1.clear();
});

undoButton.addEventListener("click", function (event) {
  var data = signaturePad.toData();

  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad.fromData(data);
  }
});
undoButton1.addEventListener("click", function (event) {
  var data = signaturePad1.toData();

  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad1.fromData(data);
  }
});

changeColorButton.addEventListener("click", function (event) {
  var r = Math.round(Math.random() * 255);
  var g = Math.round(Math.random() * 255);
  var b = Math.round(Math.random() * 255);
  var color = "rgb(" + r + "," + g + "," + b +")";

  signaturePad.penColor = color;
});
changeColorButton1.addEventListener("click", function (event) {
  var r = Math.round(Math.random() * 255);
  var g = Math.round(Math.random() * 255);
  var b = Math.round(Math.random() * 255);
  var color = "rgb(" + r + "," + g + "," + b +")";

  signaturePad1.penColor = color;
});

savePNGButton.addEventListener("click", function (event) {
  if (signaturePad.isEmpty()) {
    alert("Vui lòng ký tên");
  } else {
    var dataURL = signaturePad.toDataURL();
    let atk = $(this).parents(".sigan_nck")
    let sina=$(atk).find(".inp-signature")
    $(sina).val(dataURL)
  }
});

savePNGButton1.addEventListener("click", function (event) {
  if (signaturePad1.isEmpty()) {
    alert("Vui lòng ký tên");
  } else {
    var dataURL = signaturePad1.toDataURL();
    let atk = $(this).parents(".sigan_nck")
    let sina=$(atk).find(".inp-signature")
    $(sina).val(dataURL)
  }
});

downloadPng.addEventListener("click", function (event) {
  if (signaturePad.isEmpty()) {
    alert("Vui lòng ký tên");
  } else {
    var dataURL = signaturePad.toDataURL();
    let atk = $(this).parents(".sigan_nck")
    let sina=$(atk).find(".inp-signature")
    $(sina).val(dataURL)
    download(dataURL, "cky_nguoimua.png");
  }
});

downloadPng1.addEventListener("click", function (event) {
  if (signaturePad1.isEmpty()) {
    alert("Vui lòng ký tên");
  } else {
    var dataURL = signaturePad1.toDataURL();
    let atk = $(this).parents(".sigan_nck")
    let sina=$(atk).find(".inp-signature")
    $(sina).val(dataURL)
    download(dataURL, "cky_nguoiduoc.png");
  }
});
