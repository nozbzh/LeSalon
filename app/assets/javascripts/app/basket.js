$(document).ready(function() {
  $(".basket_item_quantity").on("change", function() {
    $(this).parent("form").submit();
  })
});
