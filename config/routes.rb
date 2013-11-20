ChristmasGiftExchange::Application.routes.draw do
  root :to => 'lists#index'

  resources :users, only: [:index, :new]
  resources :lists, only: [:index, :new, :create, :show]
end
