Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  # Defines the root path route ("/")
  # root "articles#index"

  resources :links, only: [], param: :index do
    member do
      post '/' => "links#create"
      delete '(:id)' => "links#destroy"
    end
  end

  resources :questions, only: %i[index show new create destroy update edit] do
    resources :answers, only: %i[new create destroy update edit], shallow: true do
      member do
        post :mark
      end
    end
  end
end
