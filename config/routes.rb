Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'site/home'
  # REST friendly routing covers entire set of REST requests
  resources :posts
end
