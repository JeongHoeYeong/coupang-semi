const id = document.getElementById("id");

$("#btn").click(() => {
  if ($("#phone").value && $("#name").value) {
    $("#searchText").text(id);
  }
});
