## Contacts

Configure the contact module from /admin/contact_settings. You can set mailer from, mailer to & mail subject. The form can be founded on /contact_us.  
  
If you want your form to have Google Recaptcha, just fill the blank inputs on /admin/contact_settings with site_key and secret_key.  

## Newsletters

To use the newsletter form, you need to call the partial "newsletter" (path: app/views/spree/shared/_newsletter.html.erb) from the view you want with:

```ruby
<%= render partial: 'spree/shared/newsletter' %>
```

This partial generates the next html:

```
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
| input_class | Changes the class of the email input. |
| button_class | Changes the class of the submit button. |
| button_text | Changes the text inside the submit button. |

