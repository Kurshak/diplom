# frozen_string_literal: true

class Api::V1::SubCategoriesController < ApplicationController
  def index
    render(
      json: sub_categories,
      each_serializer: Api::V1::SubCategories::IndexSerializer
    )
  end

  def show
    render(
      json: sub_category,
      include: %w[category claims ],
      each_serializer: Api::V1::SubCategories::ShowSerializer
    )
  end

  private

  def sub_category
    SubCategory.find(params[:id])
  end

  def sub_categories
    Category.find(params[:category_id]).sub_categories
  end
end
