Rails.application.routes.draw do

  resources :items, except: [:new, :edit, :index]

  resources :patients, except: [:new, :edit, :index] do
    resources :items, only: [:new, :edit]
  end

  resources :clinics do 
    resources :patients, only: [:new, :edit]
  end

  root to: "clinics#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

end