Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  namespace :api do
    namespace :v1 do
      resources :tweets, only: %i[index show]
      scope :tweets do
        post '/like', to: 'tweets#like'
        post '/retweet', to: 'tweets#retweet'
      end
    end
  end
end
