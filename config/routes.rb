Rails.application.routes.draw do
  get 'pool/heartbeat'

  resources :indices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'callback', to: 'index#callback'
  get 'logout', to: 'index#logout'
  get 'pool/heartbeat', to: 'pool#heartbeat'
  post 'callback', to: 'index#invalidate_callback'
end
