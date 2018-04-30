GuestUsers::Engine.routes.draw do
  resources :users, path: '/guests'
end
