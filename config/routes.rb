Rails.application.routes.draw do
  resources :people
  root 'people#index'

  resources :people do
    member do
      get :delete
    end
  end
  
end
