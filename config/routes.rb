ChristmasGiftExchange::Application.routes.draw do
  root :to => 'lists#index'

  resources :lists, only: [:index, :new, :create]
end
