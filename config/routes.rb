Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/favicon.ico', to: redirect('/favicon.ico')

  scope module: 'api' do
    namespace :v1 do
      resources :jobs, only: [:index, :show, :create, :update, :destroy]

      resources :companies, only: [:index, :show, :create, :destroy] do
        resources :jobs, only: [:index, :show, :create, :update, :destroy], module: :companies
      end

      resources :geeks, only: [:index, :show]

      resources :applies, only: [:index, :create]
    end
  end

  match "*path", to: "application#catch_404", via: :all

  # Defines the root path route ("/")
  # root "posts#index"
end
