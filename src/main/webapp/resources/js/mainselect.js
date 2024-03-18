$("#btn").click(() => {
  var dosi = document.getElementById("dosi");
  var sele = document.getElementById("sele");
  var value1 = sele.options[sele.selectedIndex].value;
  var value2 = dosi.options[dosi.selectedIndex].value;

  var previousValue = value2;
  localStorage.setItem("previousValue", previousValue);

  $("#text").text("value1 = " + value1 + " value2 =" + value2);

  if (value1 == "tourist") {
    location.href="tourplace/search"
  } else if (value1 == "food") {
    location.href = "/";
  }
});
