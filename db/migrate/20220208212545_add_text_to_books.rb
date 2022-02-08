class AddTextToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :text, :text
  end
end
