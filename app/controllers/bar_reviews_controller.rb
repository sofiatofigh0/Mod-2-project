class BarReviewsController < ApplicationController
    def new
        @bar_review=BarReview.new
    end
    
    def create
        @bar_review=BarReview.create(strong_params)
        if @bar_review.valid? 
            redirect_to bar_path(@bar_review.bar.id)
        else 
            flash[:errors] = @bar_review.errors.full_messages
            redirect_to new_bar_review_path
        end
        
    end

    def edit

        @bar_review=BarReview.find(params[:id])
     end
     
     def update
         @bar_review=BarReview.find(params[:id])

         if @bar_review.update(strong_params)
            redirect_to user_path(@bar_review.user.id)
         else
            flash[:errors]=@bar_review.errors.full_messages
            redirect_to edit_bar_review_path
         end
     end
 
     def show
        @bar_review=@logged_in_user.bar_reviews
     end
     
     def destroy
         @bar_review=BarReview.find(params[:id])
         @bar_review.destroy
         redirect_to user_path(@bar_review.user.id)
     end

private
   def strong_params
        params.require(:bar_review).permit(:bar_id,:user_id,:title,:safety,:hand_sanitizer,:masks,:to_go,:reduced_seating,:content)
   end
    

end
