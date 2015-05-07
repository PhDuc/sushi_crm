class PortalUser < ActiveRecord::Base
  has_many :users

  def authenticated?
    return true
  end
end
