Rails.application.routes.draw do
  
  resources :employees do 
    post :send_invoices, on: :collection
  end
  resources :departments, only: %i[index new create destroy]

  root 'employees#index'
end
