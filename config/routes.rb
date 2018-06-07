Rails.application.routes.draw do
  

  resources :posts
  get 'messages/index'
  get 'conversations/index'
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :friends
  devise_for :users, :controllers => { registrations:
'registrations' }
  resources :users do
      resources :posts do
        resources :likes
      end
    end
  resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :create]



end
  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
