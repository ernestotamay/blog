class Article < ApplicationRecord
  #indicamos al modelo que tiene un campo con texto enriquecido y un identificador
has_rich_text :content


  #Relacion de uno a muchos
  #Article pertenece a User
  belongs_to :user

  #Relacion de muchos a muchos por medio de tabla asociativa
  has_many :has_categories #proviene de HasCategory
  has_many :categories, through: :has_categories #tiene muchas categories atraves de has_categories

  attr_accessor :category_elements

  def save_categories
      return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

      has_categories.where.not(category_id: category_elements).destroy_all

      category_elements.each do |category_id|
        HasCategory.find_or_create_by(article: self, category_id: category_id)
      end
  end


end