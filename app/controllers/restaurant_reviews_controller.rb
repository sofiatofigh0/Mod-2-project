class RestaurantReviewsController < ApplicationController
    def index
        
    end
    
    def new
        @restaurant_review=@logged_in_user.restaurant_reviews.new
    end
    
    def create
        @restaurant_review=@logged_in_user.restaurant_reviews.create(strong_params)
        if @restaurant_review.valid? 
            redirect_to restaurant_path(@restaurant_review.restaurant.id)
        else 
            flash[:errors] = @restaurant_review.errors.full_messages
            redirect_to new_restaurant_review_path
        end
    end
    
    def edit

       @restaurant_review=RestaurantReview.find(params[:id])
    end
    
    def update
        @restaurant_review=RestaurantReview.find(params[:id])

        if @restaurant_review.update(strong_params)
            redirect_to user_path(@restaurant_review.user.id)
        else
            flash[:errors]=@restaurant_review.errors.full_messages
            redirect_to edit_restaurant_review_path
        end
    end

    def show
        @restaurant_review=@logged_in_user.restaurant_reviews
    end
    
    def destroy
        @restaurant_review=RestaurantReview.find(params[:id])
        @restaurant_review.destroy
        redirect_to user_path(@restaurant_review.user.id)
    end

    private
    def strong_params
        params.require(:restaurant_review).permit(:restaurant_id,:user_id,:safety,:hand_sanitizer,:masks,:to_go,:reduced_seating,:content,:title)
   end
end
