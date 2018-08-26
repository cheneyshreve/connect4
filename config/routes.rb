Rails.application.routes.draw do
  get 'welcome/about'
  get 'boards/draw'
  get 'boards/new'
  get 'boards/win'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "boards#new"

  post '/boards/:id', to: 'boards#update'
end
