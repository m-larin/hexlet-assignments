# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  scope '/(:locale)', locale: /en|ru/ do
    root 'home#index'
    resources :posts do
      scope module: :posts do
        resources :comments, include: [:new, :create, :index]
      end
    end
    scope module: :posts do
      resources :comments, except: [:new, :create, :index]
    end
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
