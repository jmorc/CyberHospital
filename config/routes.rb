Rails.application.routes.draw do

  resources :patient_data, except: [:new, :edit, :index]

  resources :patients, except: [:new, :edit, :index] do
    resources :patient_data, only: [:new, :edit]
  end

  resources :clinics do 
    resources :patients, only: [:new, :edit]
  end

  root to: "clinics#index"

  devise_for :users
end
