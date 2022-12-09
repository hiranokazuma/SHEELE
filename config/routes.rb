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

  resources :notifications, only: [:index, :destroy]

  resources :messages, except: [:update]

    get 'view_applications/confirm' => 'view_applications#confirm'
    get 'view_applications/complete' => 'view_applications#complete'
  resources :view_applications, except: [:new, :show]

    get 'properties/myproperties' => 'properties#myproperties'
    post 'properties/confirm' => 'properties#confirm'
    get 'properties/complete' => 'properties#complete'
  resources :properties

    get 'users/mypage' => 'users#top'
    get 'users/information' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'

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

  resources :view_applications, only: [:index, :edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]

  resources :properties, except: [:create, :new]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
