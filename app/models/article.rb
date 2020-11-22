class Article < ApplicationRecord
  #indicamos al modelo que tiene un campo con texto enriquecido y un identificador
  has_rich_text :content
  #Article pertenece a User
  belongs_to :user
end
