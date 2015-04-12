Rails.application.routes.draw do
  root 'cohorts#index'
  resources :cohorts, :only => [] do
    resources :students
    get 'twitter/follow' => 'twitter#follow', :as => 'twitter_follow'
  end

  get '/cohorts' => 'cohorts#index', :as => 'cohorts'
  get '/cohorts/:id' => 'cohorts#show', :as => 'cohort'

  get '/signin' => 'sessions#new', :as => 'signin'
  get '/auth/twitter/callback' => 'sessions#create'
  delete '/signout' =>'sessions#destroy', :as => 'signout'

end
