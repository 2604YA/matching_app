Rails.application.routes.draw do
  root 'home_pages#home'
  get 'home_pages/home'
  get 'home_pages/help'
  get 'home_pages/about'
  get 'home_pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
