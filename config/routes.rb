SimpleCms::Application.routes.draw do

  root "access#index"

  # match 'search' => 'admin_users#search', :via => [:get, :post]
  get 'get_contactlists' => 'admin_users#api_show_contacts', :as => 'get_contactlists'
  get 'del_contact' => 'admin_users#api_dele_contact', :as => 'del_contact'
  post 'update_contact' => 'admin_users#api_update_contact', :as => 'update_contact', :via => [:post]
  post 'create_contact' => 'admin_users#api_create_contact', :as => 'create_contact', :via => [:post]

  match "/contacts/:importer/callback" => "admin_users#gindex", :via => [:get]
  match "/oauth2callback" => "admin_users#contact", :via => [:get]

  match ':controller(/:action(/:id))', :via => [:get, :post]
end
