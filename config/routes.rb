Rails.application.routes.draw do
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  devise_for :users
  get 'users/:id/profile' => 'users#profile', as: 'profile_user'
  get 'recommenders/promise' => 'recommenders#promise', as: 'promise_recommender'
  resources :users, only: [:show, :edit, :update]
  resources :recommenders, only: [:show, :new, :create]
  resources :topics, only: [:index, :create, :show, :destroy] do
    resources :recommends, only: [:new, :create, :destroy]
  end

end
