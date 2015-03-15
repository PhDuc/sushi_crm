class User < ActiveRecord::Base

  def authenticated?
    return true
  end
end
