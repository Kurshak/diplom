# frozen_string_literal: true

class ClaimUser < ApplicationRecord
  belongs_to :user
  belongs_to :claim
end
