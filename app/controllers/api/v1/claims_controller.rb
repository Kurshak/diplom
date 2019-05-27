# frozen_string_literal: true

class Api::V1::ClaimsController < ApplicationController
  def index
    render(
      json: sub_category.claims,
      each_serializer: Api::V1::Claims::IndexSerializer
    )
  end

  def create
    new_claim = Claim.new(claim_params.merge(owner_id: current_user))
    if new_claim.save
      render json: new_claim, status: :ok
    else
      render json: { errors: new_claim.errors.full_messages }, status: 400
    end
  end

  def show
    render(
      json: claim,
      include: %w[sub_category owner comments],
      each_serializer: Api::V1::Claims::ShowSerializer
    )
  end

  def update
    if claim.update_attributes(claim_params)
      render json: claim, status: :ok
    else
      render json: { errors: claim.errors.full_messages }, status: 400
    end
  end

  def destroy
    claim.delete
  end

  private

  def claim_params
    params.permit(:title, :description, :date, :adress, :lat, :lon)
  end

  def claim
    Claim.find(params[:id])
  end

  def sub_category
    SubCategory.find(params[:sub_category_id])
  end
end
