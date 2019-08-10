class Detail < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :credits, presence: true 

  before_validation :initialize_credits_with_default
  
  private
    # Still vague implementation, might change later
    def decrement_credit
      self.detail.credit -= 1
      self.detail.save!
    end

    def increment_credit
      self.detail.credit -= 1
      self.detail.save!
    end

    def avatar_can_only_be_image
      errors.add(:avatar, "Only Image files can be uploaded") unless avatar.nil? && avatar.image?
    end

    def initialize_credits_with_default
      self.credits = 5 if credits.blank?
    end
end
