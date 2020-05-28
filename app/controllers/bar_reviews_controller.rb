class BarReviewsController < ApplicationController
    def new
        @bar_review=barReview.new
    end
    
    def create
        @bar_review=BarReview.create(strong_params)
        redirect_to bar_path(@bar_review.bar.id)
    end

private
   def strong_params
        params.require(:bar_review).permit(:bar_id,:user_id,:title,:safety,:hand_sanitizer,:masks,:to_go,:reduced_seating,:content)
   end
    

end
