Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  #encapsulates all popular routes apps use. in terminal run rake routes to see 
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
