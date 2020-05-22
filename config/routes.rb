Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :product_details, only: %i{show}
  resources :dashboard, only: %i{index}
  namespace :dashboard do
    resources :groups, except: %i{show}
    resources :families, except: %i{show}
    resources :tax_classifications, except: %i{show}
    resources :products
  end
end
