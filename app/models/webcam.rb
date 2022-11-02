class Webcam < ApplicationRecord
    def self.search(search)
        puts "searching: #{search}"
        myarray_with_percetage_signs = search.map {|val| "%#{val}%" }
        where("category ILIKE ANY ( array[?] )", myarray_with_percetage_signs)
        # select only unique
    end
end
