# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/:id' => 'users#show', as: 'user'
end
