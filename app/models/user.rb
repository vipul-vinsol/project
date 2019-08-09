class User < ApplicationRecord
  has_secure_password

  has_one :detail, dependent: :destroy

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true

  def activate
    self.active = true
    self.activation_token = nil
    save!(validate: false)
  end
end
