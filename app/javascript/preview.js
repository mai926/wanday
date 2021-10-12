document.addEventListener(
  "DOMContentLoaded",
  function () {
    function previewFile(file) {
      // プレビュー画像を追加する要素
      const preview = document.getElementById("image-list");

      // FileReaderオブジェクトを作成
      const reader = new FileReader();

      // URLとして読み込まれたときに実行する処理
      reader.onload = function (e) {
        const imageUrl = e.target.result; // URLはevent.target.resultで呼び出せる
        const img = document.createElement("img"); // img要素を作成
        img.src = imageUrl; // URLをimg要素にセット
        preview.appendChild(img); // #previewの中に追加
      };

      // いざファイルをURLとして読み込む
      reader.readAsDataURL(file);
    }

    const fileInput = document.getElementById("posts-image");
    const handleFileSelect = () => {
      const files = fileInput.files;
      for (let i = 0; i < files.length; i++) {
        previewFile(files[i]);
      }
    };
    fileInput.addEventListener("change", handleFileSelect);
  },
  false
);
// function preview() {
//   const ImageList = document.getElementById("image-list");

//   if (!ImageList) return null;

//   const createImageHTML = (blob) => {
//     const imageElement = document.createElement("div");
//     imageElement.setAttribute("class", "image-element");
//     let imageElementNum = document.querySelectorAll(".image-element").length;

//     const blobImage = document.createElement("img");
//     blobImage.setAttribute("src", blob);
//     blobImage.setAttribute("class", "preview-image");

//     imageElement.setAttribute("id", `item_image_${imageElementNum}`);

//     imageElement.appendChild(blobImage);
//     ImageList.appendChild(imageElement);
//   };

//   document.getElementById("item-image").addEventListener("change", function (e) {
//     const file = e.target.files[0];
//     console.log(e.target.files);

//     const blob = window.URL.createObjectURL(file);

//     createImageHTML(blob);
//   });
// }
// window.addEventListener("load", preview);

// document.addEventListener("DOMContentLoaded", function () {
//   if (document.getElementById("posts-image")) {
//     const ImageList = document.getElementById("image-list");

//     const createImageHTML = (blob) => {
//       const imageElement = document.createElement("div");
//       imageElement.setAttribute("class", "image-element");
//       let imageElementNum = document.querySelectorAll(".image-element").length;

//       const blobImage = document.createElement("img");
//       blobImage.setAttribute("src", blob);
//       blobImage.setAttribute("class", "preview-image");

//       const inputHTML = document.createElement("input");
//       inputHTML.setAttribute("id", `post_image_${imageElementNum}`);
//       inputHTML.setAttribute("name", "post[images][]");
//       inputHTML.setAttribute("type", "file");

//       imageElement.appendChild(blobImage);
//       imageElement.appendChild(inputHTML);
//       ImageList.appendChild(imageElement);

//       inputHTML.addEventListener("change", (e) => {
//         // console.log("hoge");
//         file = e.target.files[0];

//         blob = window.URL.createObjectURL(file);

//         createImageHTML(blob);
//       });
//     };
//     // ここにfor文で繰り返し処理を書いてみる
//     document.getElementById("posts-image").addEventListener("change", function (e) {
//       const file = e.target.files[0];
//       // console.log(e.target.files);
//       let blob = window.URL.createObjectURL(file);

//       createImageHTML(blob);
//     });
//   }
// });
