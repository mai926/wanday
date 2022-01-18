$(document).on("click", ".show-img", function () {
  $("#grayDisplay").html($(this).prop("outerHTML"));
  $("#grayDisplay").fadeIn(200);
  return false;
});

$(document).on("click", "#grayDisplay", function () {
  $("#grayDisplay").fadeOut(200);
  return false;
});
