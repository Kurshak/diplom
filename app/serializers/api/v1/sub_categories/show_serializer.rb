# frozen_string_literal: true

class Api::V1::SubCategories::ShowSerializer < Api::V1::SubCategories::IndexSerializer
  attributes :id, :title, :description
  has_many :claims
  has_one :category
end
