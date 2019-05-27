# frozen_string_literal: true

class Api::V1::Claims::ShowSerializer <  ActiveModel::Serializer

  attributes :id, :title, :description, :adress, :sub_category
  has_one :sub_category

  def sub_category
    { self: object.adress }
  end
end
