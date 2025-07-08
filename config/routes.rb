Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :home, only: [:index]
      resources :users, only: [:index]

      put '/users/:id/activate', to: 'users#activate'
      put '/users/:id/inactivate', to: 'users#inactivate'

      post '/webhooks', to: 'webhooks#create'
    end
  end

  devise_for(
    :users,
    path: '',
    path_names: { registration: 'sign_up' },
    controllers: {
      sessions: 'api/v1/users/sessions',
      registrations: 'api/v1/users/registrations'
    }
  )
end
