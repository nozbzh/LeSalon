$(".sample-image").on("click", function() {
  var id = $(this).attr("id").slice($(this).attr("id").lastIndexOf("_") + 1, $(this).attr("id").length)
  $("#product_ref_id_" + id).click()
})

