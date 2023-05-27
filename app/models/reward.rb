class Reward < ApplicationRecord
  belongs_to :question

  has_one_attached :file

  validate :correct_file_type
  validate :file_presence
  validates :name, presence: true


  private

  def correct_file_type
    if file.attached? && !file.content_type.in?(%w(image/jpeg image/png image/gif image/webp))
      file.purge
      errors.add(:file, 'Must be a JPEG, PNG, GIF, or WEBP')
    end
  end

  def file_presence
    errors.add(:file, "can't be blank") unless file.attached?
  end
end
