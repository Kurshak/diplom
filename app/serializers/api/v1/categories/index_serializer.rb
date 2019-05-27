# frozen_string_literal: true

class Api::V1::Categories::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :sub_categories
end
