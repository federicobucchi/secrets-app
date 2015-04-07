Rails.application.routes.draw do
  # Landing page
  root :to => "pages#landing"

  # Home page
  get "pages/home" => "pages#home"

  # New Secret
  get "secrets/new" => "secrets#new"
  get "secrets/generated/:token" => "secrets#show"
  post "secrets/create" => "secrets#create"
end
