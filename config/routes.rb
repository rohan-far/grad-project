Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
  resources :employees do 
    post :send_invoices, on: :collection
  end
  resources :departments, only: %i[index new create destroy]

  root 'employees#index'
end
