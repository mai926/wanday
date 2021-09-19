window.addEventListener("load", function () {
  console.log("ok");
  const pullDownButton = document.getElementById("lists");
  const pullDownParents = document.getElementById("pull-down");
  // const pullDownChild = document.querySelectorAll("pull-down-list");

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

    // pullDownChild.addEventListener("mouseover", function () {
    //   console.log("OK");
    //   this.setAttribute("style", "color:#9ec3bc");
    // });

    // pullDownChild.addEventListener("mouseout", function () {
    //   this.removeAttribute("style", "color:#aa998a");
    // });
  });
});
