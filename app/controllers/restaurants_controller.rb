class RestaurantsController < ApplicationController
        def index
            @restaurants=Restaurant.all
        end
        
        def new
            @restaurant=Restaurant.new
        end
        
        def create
            @restaurant=Restaurant.create(strong_params)
    
            redirect_to restaurant_path(@restaurant.id)
        end
        
        def edit
            @restaurant=Restaurant.find(params[:id])
        end
        
        def update
            @restaurant=Restaurant.find(params[:id])
            @restaurant.update(strong_params)
            redirect_to restaurant_path(@restaurant.id)
        end
        
        def show
            @restaurant=Restaurant.find(params[:id])
        end
        
        def destroy
            @restaurant=Restaurant.find(params[:id])
            @restaurant.destroy
            redirect_to restaurants_path
        end
    
        private
        def strong_params
            params.require(:restaurant).permit(:name,:cuisine,:address,:phone_number,:yelp_rating,:price_range,:img_url)
            
        end
    end
    