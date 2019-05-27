# frozen_string_literal: true

class Api::V1::Categories::ShowSerializer < Api::V1::Categories::IndexSerializer
  attributes :id, :title, :description
  has_many :sub_categories
end
