class AddCategoryToWebcams < ActiveRecord::Migration[7.0]
  def change
    add_column :webcams, :category, :string
  end
end
