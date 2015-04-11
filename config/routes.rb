Rails.application.routes.draw do
  root 'cohorts#index'
  resources :cohort

  get 'signin' => 'sessions#new', :as => 'signin'
  get '/auth/twitter/callback' => 'sessions#create'
  delete 'signout' =>'sessions#destroy', :as => 'signout'

end
