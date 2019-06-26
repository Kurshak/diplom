# frozen_string_literal: true

class Claim < ApplicationRecord
  # Associations
  belongs_to :sub_category, class_name: 'SubCategory', foreign_key: 'sub_category_id'
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_one_attached :image
  has_many :comments, class_name: 'Comment'

  # Validation
  validates :title,         length: { maximum: 50 }, presence: true
  validates :description,   presence: true
  # Scopes
  scope :active, -> { where(done: true) }
  # validates :adress,        presence: true
  # validate :correct_image_mime_type
  # validate :check_image_size

  # before_save :image_attached

  # MAX_SIZE = 30_000_000

  # def image_attached
  #   resize_image if image.attached?
  # end

  # def check_image_size
  #   errors.add :to_big_image, I18n.t('to_big_image') if image.attached? && image.blob.byte_size > MAX_SIZE
  # end

  # def correct_image_mime_type
  #   errors.add :wrong_format_image, I18n.t('wrong_format_image') if image.attached? && !image.content_type.in?(%w[image/png image/jpg image/jpeg])
  # end
end
