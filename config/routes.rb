Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "public/users/registrations",
    sessions: "public/users/sessions"
  }
  scope module: :public do
    root to: "home#top"
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :spots, only: [:index, :show, :create]
  end
  
  devise_for :admins, path: "admin/admins", controllers: {
    sessions: "admin/admins/sessions"
  }
  namespace :admin do
    root to: 'home#top'
  end
end
