class Question < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :topics
  # TODO Remeber to remove orphens 
  has_one_attached :attachment

  has_many :answers

  validates :title, :content, presence: true
  validate :attachment_can_only_be_pdf

  def attachment_can_only_be_pdf
    if attachment.nil? && attachment.content_type != "application/pdf"
      errors.add(:attachment, "Only pdf can be used")
    end 
  end

  def assign_tags(all_topic_ids)
    ids = all_topic_ids.reject(&:empty?).map(&:strip)
    ids.each do |id|
      self.topics << Topic.find(id)
    end
  end
end
