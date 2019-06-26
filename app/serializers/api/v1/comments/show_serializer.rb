# frozen_string_literal: true

class Api::V1::Comments::ShowSerializer < Api::V1::Comments::IndexSerializer
  attributes :comment_text, :claim_id, :user_id
  has_one :claim
end
