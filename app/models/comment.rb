# frozen_string_literal: true

class Comment < ApplicationRecord
  # Associations
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_one_attached :image
  belongs_to :claim, class_name: 'Claim', foreign_key: 'claim_id'
  # Validation
  validates :comment_text, presence: true
  # validate :correct_image_mime_type
  # validate :check_image_size

  # MAX_SIZE = 30_000_000

  # def check_image_size
  #   errors.add :to_big_image, I18n.t('to_big_image') if image.attached? && image.blob.byte_size > MAX_SIZE
  # end

  # def correct_image_mime_type
  #   errors.add :wrong_format_image, I18n.t('wrong_format_image') if image.attached? && !image.content_type.in?(%w[image/png image/jpg image/jpeg])
  # end
end
