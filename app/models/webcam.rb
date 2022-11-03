class Webcam < ApplicationRecord
    validates :title, :image_url, :category, :player_url, presence: true
    def self.search(search)
        where("title ILIKE ?", "%#{search}%")
    end
    def self.searchwithcategories(categories,search)
        myarray_with_percetage_signs = categories.map {|val| "%#{val}%" }
        where("title ILIKE ? AND category ILIKE ANY ( array[?] )", "%#{search}%", myarray_with_percetage_signs)
    end
end
