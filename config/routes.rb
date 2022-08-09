Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      # resources :posts, only: %i[index]
      post '/signup', to: 'registrations#signup'
      post '/login', to: 'sessions#login'
      delete '/logout', to: 'sessions#logout'
      get '/logged_in', to: 'sessions#logged_in?'
      resources :chat_messages, only: %i[index show create]
      resources :chat_rooms, only: %i[index new show create]
      resources :posts, only: %i[index create destroy show]
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
