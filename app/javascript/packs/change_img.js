window.changeImg = function changeImg(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#img-prev')
        .attr('src', e.target.result);
    };

    reader.readAsDataURL(input.files[0]);
  }
}

$( document ).ready(function() {
  $('#change-img-btn').on('click', function () {
    $('#change-img-field').click();
    return false;
  });
});

