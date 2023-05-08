Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  # Defines the root path route ("/")
  # root "articles#index"

  resources :questions, only: %i[index show new create destroy] do
    resources :answers, only: %i[new create destroy], shallow: true
  end
end
