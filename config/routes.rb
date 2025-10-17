Rails.application.routes.draw do
  namespace :admin do
    get "dashboard/index"
  end
  get "dashboard/show"
  get "pages/home"
  get "pages/dashboard"
  devise_for :users, path: "auth", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

  # the below using scope route allows us to have customized,  our routes for each user in app/ and it doesn't need for a controller of app
  # to be created to use it.
  scope "app/:user_id" do
    get "dashboard", to: "dashboard#show", as: :user_dashboard
    # resources :dashboard, only: [ :show ]
  end

  # namespace route enables us to have custom name space with also point to the controller
  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "dashboard#show"
end
