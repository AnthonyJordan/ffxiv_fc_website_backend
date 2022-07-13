Rails.application.routes.draw do
  devise_for :users, :controllers  => {
    registrations: 'my_devise/registrations', sessions: 'my_devise/sessions'}
  resources :users, only: [:index, :show, :create]
  resources :comments, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
