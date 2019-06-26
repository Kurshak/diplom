require "administrate/base_dashboard"

class ClaimDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sub_category: Field::BelongsTo.with_options(class_name: "SubCategory"),
    owner: Field::BelongsTo.with_options(class_name: "User"),
    image: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    done: Field::Boolean,
    lat: Field::Number.with_options(decimals: 2),
    lon: Field::Number.with_options(decimals: 2),
    owner_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    adress: Field::String,
    sub_category_id: Field::Number,
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
    :adress,
    :sub_category,
    :owner,
    :image,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :sub_category,
    :owner,
    :image,
    :id,
    :title,
    :description,
    :done,
    :lat,
    :lon,
    :owner_id,
    :created_at,
    :updated_at,
    :adress,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sub_category,
    :owner,
    :image,
    :title,
    :description,
    :done,
    :lat,
    :lon,
    :adress,
  ].freeze

  # Overwrite this method to customize how claims are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(claim)
  #   "Claim ##{claim.id}"
  # end
  def display_resource(claim)
    "#{claim.title}"
  end
end
