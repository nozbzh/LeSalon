$(".sample-image").on("click", function() {
  $(".sample-image-active").removeClass("sample-image-active")
  $(this).addClass('sample-image-active')
});

$(".product-thumbnail-img-link").click(function(e){
  e.preventDefault();
  var img_url = $(this).data("large-img");
  $(".product-large-img").attr("src", img_url);
});

$(".show-thumbnails").on("click", function() {
  $(".show-thumb-active").removeClass("show-thumb-active")
  $(this).addClass('show-thumb-active')
});
