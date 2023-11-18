function post (){
  const form = document.getElementById("finish");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(finish);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/finishes", true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
};

window.addEventListener('turbo:load', post);