class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def reviews
        Review.where(user_id: self.id)
    end

    def products
        self.reviews.map do |review|
            review.product
        end
    end

    def favorite_product
        self.products.max_by do |product|
            product.reviewa.count
        end
    end

    def remove_reviews(product)
        self.reviews.each do |review|
            if review.product == product
                review.destroy
            end
        end
    end

end