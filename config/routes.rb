Rails.application.routes.draw do
  # Landing page
  root :to => "pages#landing"

  # Home page
  get "pages/home" => "pages#home"
end
