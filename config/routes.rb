SushiCrm::Application.routes.draw do
  root to:                       'home#index', anchor: 'dashboard'
  # Main controller
  get 'home'                     => 'home#index'
  get 'home/user_login'          => 'home#user_login'
  get 'dashboard'                => 'dashboard#index'
  get 'dashboard/agent'          => 'dashboard#agent'
  get 'dashboard/:action'        => 'dashboard'
  get 'dashboard/lead/:action'   => 'lead'

  post 'home/user_register'      => 'home#user_register'
  post 'twilio/voice'            => 'twilio#voice'
  post 'twilio/connect_customer' => 'twilio#connect_customer'
end
