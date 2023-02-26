class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    def user
        User.find(self.user_id)
    end

    def product
        Product.find(self.product_id)
    end

    def print_all_review
        puts "Review for #{self.product.name} by #{self.user.name}: #{self.star_rating} . #{self.comment}"
    end
end