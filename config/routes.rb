Rails.application.routes.draw do
  resources :doctor_unavailabilities
  devise_for :patients
  devise_for :doctors
  root 'home#index'
  resources :appointments
  get 'patient/patient_index' => 'appointments#patient_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
