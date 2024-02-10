ForemanImageBuilder::Engine.routes.draw do
  resources :blueprints, only: [:index, :new, :create] do
    member do
      post 'build'
    end
  end
  resources :images, only: [:index] do
    member do
      post 'sync'
      get 'predeploy'
      post 'deploy'
    end
  end
  get 'welcome', to: '/react#index', as: 'welcome'
end

Foreman::Application.routes.draw do
  mount ForemanImageBuilder::Engine, at: '/foreman_image_builder'
end
