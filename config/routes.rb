Rails.application.routes.draw do
  resources :patients do
    resources :consultation_requests, only: [:create] do
      resources :recommendations, only: [:create]
    end
    get 'recommendations', to: 'patients#recommendations'
  end
end