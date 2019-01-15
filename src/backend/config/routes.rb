Rails.application.routes.draw do
  devise_for :users
  
  scope :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :products, only: [:index, :create, :show]
      resources :purchases, only: [:create]
      post "purchase/reserve" => "purchases#reserve"
    end
  end
end
