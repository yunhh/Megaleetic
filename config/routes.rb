Rails.application.routes.draw do

  get 'steps/show' #a virer
  get 'courses/index' #a virer
  get 'courses/show' #a virer
  devise_for :users
  root to: 'pages#home'



  resources :courses, only: [:index, :show] do
    resources :steps, only: :show
    resources :user_courses, only: :create
  end


  resources :user_steps, only: [:update] do
    member do
      patch :mark_as_done
    end
  end

  resource :profile, only: :show

end
