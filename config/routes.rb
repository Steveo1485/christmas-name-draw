ChristmasGiftExchange::Application.routes.draw do
  root :to => 'lists#index'

  resources :users, only: [:index, :new, :create] do
    resources :list, only: [:index, :new, :create, :show], controller: "lists"
  end
end
