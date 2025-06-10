Rails.application.routes.draw do
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "programs#index"
  resources :users
  resources :programs do
    resources :workouts do
      resources :exercises do
        resources :exercise_sets
      end
    end
  end
end
