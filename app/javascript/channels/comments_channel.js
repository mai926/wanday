import consumer from "./consumer";
if (location.pathname.match(/items/) && location.pathname.match(/\d+/)) {
  consumer.subscriptions.create("CommentsChannel", {
    connected() {},

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
      <div class="comment">
        <div class="user-info">${data.account.nickname}</div>
        <p>${data.comment.comment}</p>
      </div>
    `;
      const comments = document.getElementById("comments");
      comments.insertAdjacentHTML("beforeend", html);
      comments.scrollTop = comments.scrollHeight;
      const commentForm = document.getElementById("comment_form");
      commentForm.reset();
    },
  });
}
