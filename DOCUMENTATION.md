## Contacts

Configure the contact module from /admin/contact_settings. You can set mailer from, mailer to & mail subject. The form can be founded on /contact_us.  
  
If you want your form to have Google Recaptcha, just fill the blank inputs on /admin/contact_settings with site_key and secret_key.  

## Newsletters

The newsletter forms uses JavaScript to do and ajax call and returns a message if the user was correctly subscribed to the table spree_newsletters.

To use the newsletter form, you need to call the partial "newsletter" (path: app/views/spree/shared/_newsletter.html.erb) from the view you want with:

```ruby
<%= render partial: 'spree/shared/newsletter' %>
```

This partial generates the next html:

```html
<div class="ct newsletters-container">
  <form class="new_newsletter" id="new_newsletter_form" onsubmit="submitNewsletter(event, '#new_newsletter_form');" action="/newsletters" accept-charset="UTF-8" method="post">
    <input type="hidden" name="authenticity_token" value="authenticity-token-hash-generate-by-rails">
    <div class="form-container">
      <input class="field email" placeholder="Email" type="text" name="newsletter[email]" id="newsletter_email"> 
      <button type="submit" class="button">
        Subscribe
      </button>
    </div>
  </form>
</div>
```

You can edit the html sending the next params:

| param | description |
|---|---|
| form_id | Changes the id of the rendered form. It can be helpful if you want to call the form multiple times and dont want ids to repeat. |
| div_class | Changes the class of the container div of input and button. |
| placeholder_text | Changes the text inside the input placeholder. |
| input_class | Changes the class of the email input. |
| button_class | Changes the class of the submit button. |
| button_text | Changes the text inside the submit button. |

By default, the form will use the function "SubmitNewsletter" to execute ajax and returns message in an alert box. If you want to change this just write your own "SubmitNewsletter" function.

```javascript
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
```
