Rails.application.routes.draw do
  resources :indices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'callback', to: 'index#callback'
  post 'callback', to: 'index#invalidate_callback'
end
