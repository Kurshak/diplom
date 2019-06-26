# frozen_string_literal: true

class Api::V1::Comments::IndexSerializer < ActiveModel::Serializer
  attributes :comment_text, :claim_id, :user_id
  has_one :claim
end
