class CreateWebcams < ActiveRecord::Migration[7.0]
  def change
    create_table :webcams do |t|
      t.integer :cam_id
      t.string :title
      t.string :location
      t.string :player_url

      t.timestamps
    end
  end
end
