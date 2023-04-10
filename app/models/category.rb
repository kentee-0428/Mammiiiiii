class Category < ApplicationRecord
  has_many :spot_category_relations
  has_many :spots, through: :spot_category_relations
end
