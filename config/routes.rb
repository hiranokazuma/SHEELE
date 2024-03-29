Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do

    post 'users/sign_up/confirm' => 'public/registrations#confirm'
    get 'users/sign_up/complete' => 'public/registrations#complete'

  end

  scope module: :public do

    root to: 'homes#top'

  resources :chats, only: [:create]

  resources :rooms, only: [:create, :show]

  resources :notifications, only: [:index, :destroy]

  resources :messages

    get 'view_applications/confirm' => 'view_applications#confirm'
    get 'view_applications/complete' => 'view_applications#complete'
  resources :view_applications, except: [:new, :show]

    get 'properties/myproperties' => 'properties#myproperties'
    get 'properties/:id/view_applications' => 'properties#view_applications', as: "property_view_applications"
    post 'properties/confirm' => 'properties#confirm'
    get 'properties/complete' => 'properties#complete'
  resources :properties

    get 'users/mypage' => 'users#top'
    get 'users/information/:id' => 'users#show', as: "users_information"
    get 'users/information/edit/:id' => 'users#edit', as: "users_information_edit"
    patch 'users/information/:id' => 'users#update'
    get 'users/unsubscribe/:id' => 'users#unsubscribe', as: "users_unsubscribe"
    patch 'users/withdraw/:id' => 'users#withdraw', as: "users_withdraw"

  resources :replies, only: [:show, :destroy]

  resources :management_notices, only: [:show]

  end

  devise_scope :admin do

    get '/admin/sign_out' => 'devise/sessions#destroy'

  end

  namespace :admin do
    get 'homes/top' => 'homes#top'

  resources :notifications, only: [:index, :destroy]

  resources :messages do
    collection do
      get 'messages/get_users' => 'messages#get_users'
    end
  end

  resources :rooms, only: [:show]

  resources :view_applications, only: [:index, :edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]

  resources :properties, except: [:create, :new]

    post 'replies/confirm' => 'replies#confirm'
    get 'replies/complete' => 'replies#complete'
  resources :replies, only: [:create, :new]

    post 'management_notices/confirm' => 'management_notices#confirm'
    get 'management_notices/complete' => 'management_notices#complete'
  resources :management_notices, except: [:index]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
