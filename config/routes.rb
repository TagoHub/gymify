Rails.application.routes.draw do
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/exercise_templates", to: "exercises#templates", as: :exercise_templates
  
  root "programs#quick_start"
  resources :users
  resources :programs do
    get :quick_start
    resources :workouts do
      member do
        get :copy_exercise
        get :start_workout
        get :preview_workout
      end
      resources :exercises do
        member do
          post :duplicate
          get :quick_sets_creation
        end
        resources :exercise_sets do
          member do
            post :duplicate
            get  :set_play_form
            get  :play_set
          end
        end
      end
    end
  end
end
