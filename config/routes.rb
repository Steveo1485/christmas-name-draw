ChristmasGiftExchange::Application.routes.draw do
  root :to => 'lists#index'

  resources :users, only: [:new]
  resources :lists, only: [:index, :new, :create, :show]
end
