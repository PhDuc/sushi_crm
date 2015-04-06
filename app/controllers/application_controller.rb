class ApplicationController < ActionController::Base
  protect_from_forgery

  # For Lograge
  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
  end

end
