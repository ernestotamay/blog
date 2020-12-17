class Category < ApplicationRecord
  has_many :has_categories
  has_many :articles, through: :has_categories #tiene muchas categories atraves de has_categories

end
