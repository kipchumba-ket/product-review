class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def reviews
        Review.where(product_id: self.id)
    end

    def users
        self.reviews.map do |review|
            review.user
        end
    end

    def leave_review(user, star_rating, comment)
        Review.create(user_id: user.id, product_id: self.id, star_rating: star_rating, comment: comment,)
    end

    def print_all_reviews
        self.reviews.each do |review|
            puts "Review for #{self.name} by #{review.user.name}: #{review.star_rating} . #{review.comment}"
        end
    end

    def average_rating
        if self.reviews.count == 0
            return 0
        else
            total_count = 0
            self.reviews.each do |review|
                total_count += review.star_rating
            end

            total_count / self.reviews.count
        end
    end


end