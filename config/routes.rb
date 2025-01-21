Rails.application.routes.draw do
  
  resources :employees
  resources :departments, only: %i[index new create destroy]
end
