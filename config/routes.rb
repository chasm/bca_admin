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
  
  get "credit_apps" => "site#index", :as => :credit_apps
  get "credit_apps/new" => "site#index", :as => :credit_apps_new
  get "credit_app/:id" => "site#index", :as => :credit_app_detail
  get "credit_app/:id/edit" => "site#index", :as => :credit_app_edit
  
  get "users" => "site#index", :as => :clients
  get "users/new" => "site#index", :as => :clients_new
  get "user/:id" => "site#index", :as => :client_detail
  get "user/:id/edit" => "site#index", :as => :client_edit

  scope "/api" do
    resources :automobiles, :except => [:new, :edit, :create], defaults: {format: :json} do
      resources :credit_applications, :except => [:new, :edit, :create], defaults: {format: :json} do
        resources :employers, :except => [ :new, :edit, :create ], defaults: {format: :json}
        resources :locations, :except => [ :new, :edit, :create ], defaults: {format: :json}
      end
    end

    resources :credit_applications, :except => [:new, :edit, :create], defaults: {format: :json} do
      resources :employers, :except => [ :new, :edit, :create ], defaults: {format: :json}
      resources :locations, :except => [ :new, :edit, :create ], defaults: {format: :json}
    end
  
    resources :users, :except => [ :new, :edit, :create ], defaults: {format: :json} do
      resources :phone_numbers, :except => [ :new, :edit, :create ], defaults: {format: :json}
      resources :logins, :only => [ :index, :show, :destroy ], defaults: {format: :json}
    end

    resources :registrants, :except => [:new, :edit, :create], defaults: {format: :json}
  end

  root :to => 'site#index'
end











