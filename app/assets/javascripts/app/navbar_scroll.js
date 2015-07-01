  // navbar transition jQuery script

$(document).ready(function() {
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 0) {
      $(".navbar").slideUp();
    }
    else {
      $(".navbar").slideDown();
    }
  });
});

