Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :forms
  get '/custom_form_new' => 'forms#custom_form_new'
  post '/custom_form_create' => 'forms#custom_form_create'
  get '/custom_form_value_new' => 'forms#custom_form_value_new'
  post '/custom_form_value_create' => 'forms#custom_form_value_create'
  resources :users
end
