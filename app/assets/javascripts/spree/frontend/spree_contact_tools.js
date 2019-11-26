// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

function submitNewsletter(e, selector) {
  e.preventDefault();

  $.ajax({
    type: "POST",
    dataType: 'JSON',
    url: $(selector).attr("action"),
    data: $(selector).serialize(),
    success: function(data) {
      if (data.status === "ok") {
       alert(data.msg)
      }
      else if (data.status === "fail") {
        alert('Error: ' + data.msg)
      }
    },
    error: function(data) {
      alert('Error: ' + data.msg)
    }
  })
}