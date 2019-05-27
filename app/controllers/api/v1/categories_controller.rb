# frozen_string_literal: true

class Api::V1::CategoriesController < ApplicationController
  def index
    render(
      json: categories,
      each_serializer: Api::V1::Categories::IndexSerializer
    )
  end

  def show
    render(
      json: category,
      include: %w[sub_categories],
      each_serializer: Api::V1::Categories::ShowSerializer
    )
  end

  private

  def category
    Category.find(params[:id])
  end

  def categories
    Category.all
  end
end
