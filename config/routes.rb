Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    resources :contacts
  end	

  resources :contacts

  get '/contact_us', to: 'contacts#new'
  get '/contact_success', to: 'contacts#success'
end