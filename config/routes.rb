Rails.application.routes.draw do
  #, except: [:show] -stops the route from using the resource
  resources :portfolios, except: [:show]
  #custom route for show very similar to pages. 
  #the as: is what you have to use on the view <%= link_to 'i am a link', portfolio_show_path(x)%> 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  #map route
  #can put whatever you want after get as long as the to: is correct       
  get 'about-me', to: 'pages#about'
  #replace get 'pages/about'
  get 'contact', to: 'pages#contact'

  #encapsulates all popular routes apps use. in terminal run rake routes to see 
  resources :blogs
  #set root path to application in this case the home page could be called anything
  #localhost:3000 now goes to the home page
  root to: 'pages#home'
end
