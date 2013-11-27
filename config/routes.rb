ChristmasGiftExchange::Application.routes.draw do
  root :to => 'users#new'

  resources :users, only: [:new, :create, :update, :show] do
    resources :lists, only: [:index, :create], controller: "lists" do
      resources :items, only: [:create, :destroy]
    end
  end
  post 'sign_in', to: 'users#sign_in'
  post 'sign_out', to: 'users#sign_out'
end
