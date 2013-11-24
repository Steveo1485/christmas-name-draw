ChristmasGiftExchange::Application.routes.draw do
  root :to => 'users#new'

  resources :users, only: [:index, :new, :create] do
    resources :lists, only: [:index, :new, :create, :show], controller: "lists" do
      resources :items, only: [:create, :destroy]
    end
  end
  post 'sign_in', to: 'users#sign_in'
end
