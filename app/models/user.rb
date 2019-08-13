class User < ApplicationRecord
  has_secure_password

  has_one :detail, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :interests
  has_many :topics, through: :interests
  has_many :answers

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

  def assign_interests(all_topic_ids)
    ids = all_topic_ids.reject {|_| _.empty? }.map { |_| _.strip }
    ids.each do |id|
      self.topics << Topic.find(id)
    end
  end
end