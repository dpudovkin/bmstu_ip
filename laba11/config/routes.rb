Rails.application.routes.draw do
  root 'number#input'
  get 'number/input'
  get 'number/view'
  get 'number/cached_results'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
