$("#btn").click(() => {
  let sele = document.getElementById("sele");
  let dosi = document.getElementById("dosi");
  let value1 = sele.options[sele.selectedIndex].value;
  let value2 = $("#dosi").val();

  var previousValue = value2;
  localStorage.setItem("previousValue", previousValue);
  
  if (value1 == "tourist") {
    location.href = "tourplace/search";
  } else if (value1 == "food") {
    location.href = "restaurant/search";
  } else {
    location.href = "/";
  }
});
