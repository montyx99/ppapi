Ppapi::Application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Omniauth
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => 'login'
  get '/signout' => 'sessions#destroy', :as => 'logout'
  get '/auth/failure' => 'sessions#failure'

  # get 'login', to: redirect('/auth/discord'), as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  get '/me' => 'me#show'
  get 'api/isloggedin' => 'sessions#logininfo'
end
