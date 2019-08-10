class User < ApplicationRecord
  has_secure_password

  has_one :detail, dependent: :destroy
  accepts_nested_attributes_for :detail, allow_destroy: true, update_only: true,
                                reject_if: :all_blank

  validates :name, :email, presence: true
  validates :password, :password_confirmation, presence: true, allow_blank: true
  validates :email, uniqueness: true

  def activate
    self.active = true
    self.activation_token = nil
    save!(validate: false)
  end
end