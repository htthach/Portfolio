Rails.application.routes.draw do
  resources :projects, except: [:show]
  get 'ios-projects', to: 'projects#ios'
  get 'project/:id', to: 'projects#show', as: 'project_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
