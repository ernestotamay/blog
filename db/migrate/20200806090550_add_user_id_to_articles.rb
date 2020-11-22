class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    # Agregar "default: 1" ya que existen articles previamente ingresados,
    # Pero no estan asociados a algun usuario,
    # Por tanto, asignar por defecto a usuario 1
    add_reference :articles, :user, null: false, foreign_key: true, default: 1
  end
end
