$(document).ready(function()
{
  $("#search").on("keyup", function()
  {
    $.ajax('/definitions/search', {
      data: {
        q: $(this).val()
      }
    })
  });
});
