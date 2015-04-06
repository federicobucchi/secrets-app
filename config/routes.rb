Rails.application.routes.draw do
  # Landing page
  root :to => "pages#landing"

  # Home page
  get "pages/home" => "pages#home"

  # New Secret
  get "secrets" => "secrets#list"
  get "secrets/new" => "secrets#new"
  get "secrets/:id" => "secrets#show"
  post "secrets/create" => "secrets#create"
end
