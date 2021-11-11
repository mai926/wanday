function editPullDown() {
  const pullDownButton = document.getElementById("edit-lists");
  const pullDownParents = document.getElementById("edit-pull-down");

  pullDownButton.addEventListener("click", function () {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }
  });
}
window.addEventListener("load", editPullDown);
