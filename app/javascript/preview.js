document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById("posts-image")) {
    const ImageList = document.getElementById("image-list");

    const createImageHTML = (blob) => {
      const imageElement = document.createElement("div");
      imageElement.setAttribute("class", "image-element");
      let imageElementNum = document.querySelectorAll(".image-element").length;

      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);
      blobImage.setAttribute("class", "preview-image");

      const inputHTML = document.createElement("input");
      inputHTML.setAttribute("id", `post_image_${imageElementNum}`);
      inputHTML.setAttribute("name", "post[images][]");
      inputHTML.setAttribute("type", "file");

      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      ImageList.appendChild(imageElement);

      inputHTML.addEventListener("change", (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
      });
    };

    document.getElementById("posts-image").addEventListener("change", function (e) {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});