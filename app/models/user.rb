# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_one_attached :avatar
  has_many :claims, class_name: 'Claim'
  has_many :comments, class_name: 'Comment'
end
