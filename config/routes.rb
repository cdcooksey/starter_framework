Rails.application.routes.draw do
  constraints format: :json do
    resources :articles, only: [:index, :show]
    resources :authors, only: [:index, :show]
  end
end
