Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :posts, only: %i[index]
      post '/signup', to: 'registrations#signup'
      post '/login', to: 'sessions#login'
      delete '/logout', to: 'sessions#logout'
      get '/logged_in', to: 'sessions#logged_in?'
    end
  end
  
end
