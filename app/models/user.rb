class User < ActiveRecord::Base
  belongs_to :portal_user
  has_many :emails
  has_many :phone_numbers
  has_many :addresses

  def authenticated?
    return true
  end
end
