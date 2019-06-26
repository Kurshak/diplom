# frozen_string_literal: true

class Api::V1::Claims::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :adress
  has_one :sub_category
  has_many :comments
end
