Rails.application.routes.draw do
  get 'customers/login', to: 'customers_login#index', as: :customer_login
  post 'customers/login/create', to: 'customers_login#create', as: :create_customer_login

  get 'orders', to: 'orders#index', as: :orders
end
