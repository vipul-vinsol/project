function readURL(input) {
  if (input.files && input.files[0]) {
    let reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById('avatar-tag').setAttribute('src',e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

function ready() {
  let avatar = document.getElementById("avatar");
  let avatarImgTag = document.getElementById("avatar-tag");
  if (avatarImgTag.getAttribute('src') === "")
    avatarImgTag.style.display = "none";
  avatar.addEventListener('change', function () {
    avatarImgTag.style.display = "inline-block";
    readURL(this);
  });
}

document.addEventListener("DOMContentLoaded", ready);