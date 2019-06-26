require "administrate/base_dashboard"

class SubCategoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    image: Field::ActiveStorage,
    category: Field::BelongsTo.with_options(class_name: "Category"),
    id: Field::Number,
    title: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    category_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :description,
    :category,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :image,
    :category,
    :id,
    :title,
    :description,
    :created_at,
    :updated_at,
    :category_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :image,
    :category,
    :title,
    :description,
  ].freeze

  # Overwrite this method to customize how sub categories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(sub_category)
  #   "SubCategory ##{sub_category.id}"
  # end
  def display_resource(sub_category)
    "#{sub_category.title}"
  end
end
