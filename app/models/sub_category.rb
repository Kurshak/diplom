# frozen_string_literal: true

class SubCategory < ApplicationRecord
  has_one_attached :image
  has_many :claims
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  MAX_SIZE = 30_000_000

  validates :title, :description, presence: true
  validate :image_attached?
  validate :correct_image_mime_type
  validate :check_image_dimensions

  before_save :resize_image

  def image_attached?
    errors.add :wrong_image, I18n.t('missing_image') if image.attached? == false
  end

  def check_image_dimensions
    errors.add :to_big_image, I18n.t('to_big_image') if image.attached? && image.blob.byte_size > MAX_SIZE
  end

  def correct_image_mime_type
    errors.add :wrong_format_image, I18n.t('wrong_format_image') if image.attached? && !image.content_type.in?(%w[image/png image/jpg image/jpeg])
  end
end
