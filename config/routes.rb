Rails.application.routes.draw do
  constraints format: :json do
    resources :authors, only: [:index]
  end
end
