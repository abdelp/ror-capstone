// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require cloudinary
//= require activestorage

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import "bootstrap"
import { start } from "@rails/activestorage"

document.addEventListener("turbolinks:load", () => {
  $(function() {
    $(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
      });

      $('#time_entry_start_time').on('change', function() {
        const zeroPad = (num) => String(num).padStart(2, '0');
        const startTime = new Date($('#time_entry_start_time').val().replace('T', ' '));
        const endTime = new Date($('#time_entry_end_time').val().replace('T', ' '));

        if((startTime instanceof Date && !isNaN(startTime)) && (
          endTime instanceof Date && !isNaN(endTime))) {
          let diffTime = Math.abs(endTime.getTime() - startTime.getTime()) / 1000;
          let hours = Math.floor(diffTime / 3600);

          diffTime %= 3600;
          let minutes = Math.floor(diffTime / 60);
          let seconds = diffTime % 60;
          $('#time_entry_amount').val(`${zeroPad(hours)}:${zeroPad(minutes)}:${zeroPad(seconds)}`);
        } else {
          $('#time_entry_amount').val("00:00:00");
        }
      });

      $('#time_entry_end_time').on('change', function() {
        const zeroPad = (num) => String(num).padStart(2, '0');
        const startTime = new Date($('#time_entry_start_time').val().replace('T', ' '));
        const endTime = new Date($('#time_entry_end_time').val().replace('T', ' '));

        if((startTime instanceof Date && !isNaN(startTime)) && (
          endTime instanceof Date && !isNaN(endTime))) {

          let diffTime = Math.abs(endTime.getTime() - startTime.getTime()) / 1000;
          let hours = Math.floor(diffTime / 3600);

          diffTime %= 3600;
          let minutes = Math.floor(diffTime / 60);
          let seconds = diffTime % 60;
          $('#time_entry_amount').val(`${zeroPad(hours)}:${zeroPad(minutes)}:${zeroPad(seconds)}`);
        } else {
          $('#time_entry_amount').val("00:00:00");
        }
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


//= require_self

// direct_uploads.js

addEventListener("direct-upload:initialize", event => {
  const { target, detail } = event
  const { id, file } = detail
  target.insertAdjacentHTML("beforebegin", `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename"></span>
    </div>
  `)
  target.previousElementSibling.querySelector(`.direct-upload__filename`).textContent = file.name
})

addEventListener("direct-upload:start", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.remove("direct-upload--pending")
})

addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail
  const progressElement = document.getElementById(`direct-upload-progress-${id}`)
  progressElement.style.width = `${progress}%`
})

addEventListener("direct-upload:error", event => {
  event.preventDefault()
  const { id, error } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--error")
  element.setAttribute("title", error)
})

addEventListener("direct-upload:end", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--complete")
})
