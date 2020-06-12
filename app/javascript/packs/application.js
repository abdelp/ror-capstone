// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require cloudinary

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import "bootstrap"

document.addEventListener("turbolinks:load", () => {
  $(function() {
    $(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
      });
    });
  });

  $(document).ready(function() {
    $('#change-img-btn').on('click', function () {
      $('#change-img-field').click();
      return false;
    });
  });

  window.changeImg = function changeImg(input) {
    if (input.files && input.files[0]) {
      let reader = new FileReader();
  
      reader.onload = function (e) {
        $('#img-prev')
          .attr('src', e.target.result);
      };
  
      reader.readAsDataURL(input.files[0]);
    }
  }
  
  window.changeGroupImg = function changeGroupImg(input) {
    if (input.files && input.files[0]) {
      let reader = new FileReader();
  
      reader.onload = function (e) {
        $('#group-img-prev')
          .attr('src', e.target.result);
      };
  
      reader.readAsDataURL(input.files[0]);
    }
  }  
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
