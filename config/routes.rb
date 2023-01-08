Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/api/v1/auth'
  root "home#index"
  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end
end
