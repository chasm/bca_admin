Bca::Application.routes.draw do
  get "login" => "sessions#new", :as => :login
  post "login" => "sessions#create"
  
  get "logout" => "sessions#destroy", :as => :logout
  
  get "reset/:code" => "sessions#reset", :as => :password_form
  put "reset/:code" => "sessions#reset_password"
  
  get "uuids" => "site#uuids", :as => :uuid
  get "uuids/:count" => "site#uuids", :as => :uuids
  
  get "autos" => "site#index", :as => :autos
  get "autos/new" => "site#index", :as => :autos_new
  get "auto/:id" => "site#index", :as => :auto_detail
  get "auto/:id/edit" => "site#index", :as => :auto_edit
  
  get "apps" => "site#index", :as => :apps
  get "apps/new" => "site#index", :as => :apps_new
  get "app/:id" => "site#index", :as => :app_detail
  get "app/:id/edit" => "site#index", :as => :app_edit
  
  get "users" => "site#index", :as => :users
  get "users/new" => "site#index", :as => :users_new
  get "user/:id" => "site#index", :as => :user_detail
  get "user/:id/edit" => "site#index", :as => :user_edit

  scope "/api" do
    resources :automobiles, :except => [:new, :edit, :create] do
      resources :credit_applications, :except => [:new, :edit, :create]
    end

    resources :credit_applications, :except => [:new, :edit, :create] do
      resources :employers, :except => [ :new, :edit ]
      resources :locations, :except => [ :new, :edit ]
    end
  
    resources :users, :except => [ :new, :edit ] do
      resources :phone_numbers, :except => [ :new, :edit ]
      resources :logins, :only => [ :index, :show, :destroy ]
    end
  end

  root :to => 'site#index'
end











