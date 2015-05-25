require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "259074545294-2rnelg2i17h6o3bfbcfkfdm4eoabpnqm.apps.googleusercontent.com", "qJu9As2I7B7t9yJ6Ym3KJlki", {:redirect_path => "/oauth2callback"}
  # importer :gmail, "99479291876-hottfk4slg8sctuivgrjckk90jbpf8hg.apps.googleusercontent.com", "Ro617b-PqpTneUU4Ic27hpbZ", {:redirect_path => "/oauth2callback"}
  # importer :gmail, "lens55mm@gmail.com", "AIzaSyAgd7qJa1cF5Oqz5jeT6XNEtAbGok6F9wo", {:redirect_path => "/oauth2callback"}
  # importer :yahoo, "dj0yJmk9WEFzREpidHBJM1U5JmQ9WVdrOWR6bEViM0ZrTTJVbWNHbzlPRGswTVRBMU9EWXkmcz1jb25zdW1lcnNlY3JldCZ4PTgw", "c43984c5cac8b07431dc0a4f4ab7f04776bdca7f", {:callback_path => '/invites/yahoo/contact_callback'}
  # importer :hotmail, "client_id", "client_secreat"
end
