class RemoveLeadingCommasFromCategories < ActiveRecord::Migration[7.0]
  def change
    Webcam.all.each do |webcam|
      webcam.category = webcam.category.sub(/^,/, '') 
      webcam.save
    end
  end
end
