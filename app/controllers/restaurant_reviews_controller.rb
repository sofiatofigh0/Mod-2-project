class RestaurantReviewsController < ApplicationController
    def index
        
    end
    
    def new
        @restaurant_review=RestaurantReview.new
    end
    
    def create
        @restaurant_review=RestaurantReview.create(strong_params)
        redirect_to restaurant_path(@restaurant_review.restaurant.id)
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
    
    end
    
    def destroy
    
    end

    private
    def strong_params
        params.require(:restaurant_review).permit(:restaurant_id,:user_id,:safety,:hand_sanitizer,:masks,:to_go,:reduced_seating)
   end
end
