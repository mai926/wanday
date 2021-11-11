window.addEventListener("load", function () {
  const pullDownButton = document.getElementById("lists");
  const pullDownParents = document.getElementById("pull-down");

  pullDownButton.addEventListener("mouseover", function () {
    this.setAttribute("style", "color:#eadfca");
  });

  pullDownButton.addEventListener("mouseout", function () {
    this.removeAttribute("style", "color:#aa998a");
  });

  pullDownButton.addEventListener("click", function () {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }
  });
});
