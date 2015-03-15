SushiCrm::Application.routes.draw do
  get 'home/index'

  root to:                       'home#index', anchor: 'dashboard'
  # Main controller
  get 'home'                  => 'home#index'
  get 'home/user_login'       => 'home#user_login'
end
