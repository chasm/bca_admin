Bca::Application.routes.draw do
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  
  get "logout" => "sessions#destroy"
  
  get "reset/:code" => "sessions#reset"
  put "reset/:id" => "sessions#reset_password"
  
  get "uuids" => "site#uuids"
  get "uuids/:count" => "site#uuids"
  
  get "autos" => "site#index", :as => :autos
  get "autos/new" => "site#index", :as => :clients
  get "auto/:id" => "site#index", :as => :clients
  get "auto/:id/edit" => "site#index", :as => :clients
  
  get "apps" => "site#index", :as => :apps
  get "apps/new" => "site#index", :as => :clients
  get "app/:id" => "site#index", :as => :clients
  get "app/:id/edit" => "site#index", :as => :clients
  
  get "clients" => "site#index", :as => :clients
  get "clients/new" => "site#index", :as => :clients
  get "client/:id" => "site#index", :as => :clients
  get "client/:id/edit" => "site#index", :as => :clients

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

  root :to => 'site#index'
end











