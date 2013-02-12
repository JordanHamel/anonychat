Forum::Application.routes.draw do
  resources :users
  resources :posts, only: [:create, :show]
  resources :comments, only: [:create]
  resources :topics do
    resources :posts, only: [:new]
  end
  resources :surveys, only: [:new, :create] do
    collection do
      get :results
    end
  end

  root to: "topics#index"
end
