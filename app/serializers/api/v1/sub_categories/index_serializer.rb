# frozen_string_literal: true

class Api::V1::SubCategories::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :claims
  has_one :category
end
