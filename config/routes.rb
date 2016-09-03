Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'
  get '/sign_up', to: 'users#new', as: :sign_up
  get '/sessions/new', to: 'sessions#new'
  get '/users/:user_id/cupboards/:id/accents', to: 'cupboards#accents'
  get '/users/:user_id/cupboards/:id/updateaccent', to: 'cupboards#updateaccent'
  patch'/users/:user_id/cupboards/:id/updateaccent', to: 'cupboards#updateaccent'

  resources :users do
    resources :cupboards
  end


end
