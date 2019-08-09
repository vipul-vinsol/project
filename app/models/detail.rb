class Detail < ApplicationRecord
  belongs_to :user

  validates :credits, presence: true
end
