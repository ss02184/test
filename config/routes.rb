Rails.application.routes.draw do

  devise_for :users
  resources :books
  #Resource paths

  #contact pages
  get '/contact', to: 'contact#contact'
  post 'request_contact', to: 'contact#request_contact'
  #Scaffold
  get '/books', to: 'books#books'

  #Home/root page
  root 'books#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
