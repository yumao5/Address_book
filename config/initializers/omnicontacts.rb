require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "259074545294-1lcnNlY3JldCZ4PTgw.apps.googleusercontent.com", "1lcnNlY3JldCZ4PTgw", {:redirect_path => "/oauth2callback"}
  # importer :gmail, "99479291876-1lcnNlY3JldCZ4PTgw.apps.googleusercontent.com", "Ro617b-1lcnNlY3JldCZ4PTgw", {:redirect_path => "/oauth2callback"}
  # importer :gmail, "lens55mm@gmail.com", "AIzaSyAgd7qJa1cF5Oqz5jeT6XNEtAbGok6F9wo", {:redirect_path => "/oauth2callback"}
  # importer :yahoo, "dj0yJmk9WEFzREpidHBJM1U5JmQ9WVdrOWR6bEViM0ZrTTJVbWNHbzlPRGswTVRBMU9EWXkmcz1jb25zdW1lcnNlY3JldCZ4PTgw", "c43984c5cac8b07431dc0a4f4ab7f04776bdca7f", {:callback_path => '/invites/yahoo/contact_callback'}
  # importer :hotmail, "client_id", "client_secreat"
end
