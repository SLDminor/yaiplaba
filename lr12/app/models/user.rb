# frozen_string_literal: true

# user activerecord class
class User < ApplicationRecord
  has_secure_password

  def update_last_login
    self.last_login = DateTime.now
    save
  end
end
