var previousValue = localStorage.getItem("previousValue");
console.log(previousValue);
$("#search_keyword").val(previousValue);
window.localStorage.clear();