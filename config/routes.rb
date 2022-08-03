Rails.application.routes.draw do
  get 'brands/index'
  namespace "api" do
    namespace "v1" do
      # resources :posts, only: %i[index]
      post '/signup', to: 'registrations#signup'
      post '/login', to: 'sessions#login'
      delete '/logout', to: 'sessions#logout'
      get '/logged_in', to: 'sessions#logged_in?'
      # post '/user_profile', to: 'user_profiles#create'
      resources :brands, only: %i[index destroy]
      resources :user_images, only: %i[new create]
      resources :user_profiles, only: %i[new create] do
        collection do
          get :show
          patch :update
        end
      end
    end
  end
end
