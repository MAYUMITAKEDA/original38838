import consumer from "./consumer"

if(location.pathname.match(/\/posts\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    post_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <div class="comment">
          <p class="user-info"><a href="/users/${data.user.id}">${data.user.nickname}</a>: </p>
          <p>${data.comment.text}</p>
        </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();

      const userLinks = comments.querySelectorAll(".user-info a");
      userLinks.forEach((link) => {
        link.addEventListener("click", (event) => {
          event.preventDefault();
          const userUrl = event.target.getAttribute("href");
          window.location.href = userUrl;
        });
      });
    }
  })
}