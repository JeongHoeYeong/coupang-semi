var previousValue = localStorage.getItem("previousValue");
console.log(previousValue);
$("#search_keyword").val(previousValue);

$(document).ready(function () {
  $(".return-top").hide(); // 탑 버튼 숨김
  $(function () {
    $(window).scroll(function () {
      if ($(this).scrollTop() > 100) {
        $(".return-top").fadeIn();
      } else {
        $(".return-top").fadeOut();
      }
    });
    $(".return-top").click(function () {
      $("body,html").animate(
        {
          scrollTop: 0,
        },
        800
      );
      return false;
    });
  });
});
