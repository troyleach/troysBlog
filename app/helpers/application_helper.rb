module ApplicationHelper
  require 'securerandom'

  def generate_password
    return SecureRandom.hex(4)
  end

  def todays_date
    Time.now.strftime('%A, %d %b %Y %l:%M %p')
  end
end
