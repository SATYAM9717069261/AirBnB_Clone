Rails.application.routes.draw do
  root "home#index"
  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end
end
