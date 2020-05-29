class RestaurantsController < ApplicationController
    skip_before_action :authorized, only: [:index,:show]

        def index
            @q = Restaurant.ransack(params[:q])
            @restaurants = @q.result(distinct: true)
       end
        
        def new
            @restaurant=Restaurant.new
        end
        
        def create
            @restaurant=Restaurant.create(strong_params)
    
            redirect_to restaurant_path(@restaurant.id)
        end
        
        def show
            @restaurant=Restaurant.find(params[:id]) 
        end
        
        private
        def strong_params
            params.require(:restaurant).permit(:name,:cuisine,:address,:phone_number,:yelp_rating,:price_range,:img_url)
        end

        def find_restaurant
            @restaurant = Restaurant.find(params[:id])
        end 
    end
    