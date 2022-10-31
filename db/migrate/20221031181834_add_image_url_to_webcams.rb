class AddImageUrlToWebcams < ActiveRecord::Migration[7.0]
  def change
    add_column :webcams, :image_url, :string
  end
end
