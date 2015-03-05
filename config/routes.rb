Rails.application.routes.draw do
  resources :patients, except: [:new, :edit, :index]

  resources :clinics do 
    resources :patients, only: [:new, :edit]
  end

  root to: "clinics#index"

  devise_for :users
end
