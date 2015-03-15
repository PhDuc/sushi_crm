SushiCrm::Application.routes.draw do
  get 'home/index'

  root to:              'home#index', anchor: 'dashboard'
  # Main controller
  get  'home'        => 'home#index'
end
