SushiCrm::Application.routes.draw do
  root to:                       'home#index', anchor: 'dashboard'
  # Main controller
  get 'home'                  => 'home#index'
  get 'home/user_login'       => 'home#user_login'
  get 'dashboard'             => 'dashboard#index'
  get 'dashboard/:action'     => 'dashboard'
end
