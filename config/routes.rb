Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    resources :contacts
    resources :newsletters

    get '/contact_settings', to: 'contacts#settings', as: 'contact_settings'
    post '/contact_settings', to: 'contacts#update_settings'
  end	
  
  resources :contacts
  resources :newsletters

  get '/contact_us', to: 'contacts#new', as: 'contact_us'
  get '/contact_success', to: 'contacts#success', as: 'contact_success'
end