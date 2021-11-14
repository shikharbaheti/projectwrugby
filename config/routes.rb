Rails.application.routes.draw do
  resources :attendancerecords
  resources :events
  resources :merchandises
  resources :transactions
  resources :recruits
  resources :alumnis
  resources :players
  resources :people

  
  resources :attendancerecords do
    member do
      get :delete
    end
  end
 

  #devise_scope :events do
  #    get '/events/:event_id/attendancerecords/:id', to: 'attendancerecords#index', as: :event_attendancerecords_path
  #    get '/events/:event_id/attendancerecords/:id/edit', to: 'attendancerecords#edit', as: :edit_event_attendancerecord_path
  #    get '/events/:event_id/attendancerecords/new', to: 'attendancerecords#new', as: :new_event_attendancerecord_path
  #end

  

  resources :people do
    member do
      get :delete
    end
  end

  resources :players do
    member do
      get :delete
    end
  end

  resources :recruits do
    member do
      get :delete
    end
  end

  resources :transactions do
    member do
      get :delete
    end
  end

  resources :merchandises do
    member do
      get :delete
    end
  end

  resources :events do
    member do
      get :delete
    end
  end

  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
end
