function post (){

  const form = document.getElementById("finish");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/finishes", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const item = XHR.response.finish;
      const html = `
        <div class="post">
          <div class="post-date">
            ${item.finish_anime}
          </div>
          <div class="post-content">
            ${item.group_id}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", html);
    };
  });
};

window.addEventListener('turbo:load', post);