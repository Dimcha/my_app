Rails.application.routes.draw do
  resources :people do
    post 'upload', on: :collection
  end

  root 'people#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
