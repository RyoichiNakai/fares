Rails.application.routes.draw do
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'users/:id/profile' => 'users#profile', as: 'profile_user'
  resources :topics, only: [:index, :new, :create, :show, :destroy] do
    resources :recommends, only: [:create, :edit, :destroy]
  end

end
