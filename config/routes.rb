ChristmasGiftExchange::Application.routes.draw do
  root :to => 'users#new'

  resources :users, only: [:new, :create] do
    resources :lists, only: [:index, :create], controller: "lists" do
      resources :items, only: [:create, :destroy]
    end
  end
  post 'sign_in', to: 'users#sign_in'
end
