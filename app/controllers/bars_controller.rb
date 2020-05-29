class BarsController < ApplicationController
    skip_before_action :authorized, only: [:index,:show]

    def index
        @q = Bar.ransack(params[:q])
        @bars = @q.result(distinct: true)
    end
    
    def new
        @bar=Bar.new
    end
    
    def create
        @bar.create(strong_params)

        redirect_to bar_path(@bar.id)
    end
    
    def show
        @bar=Bar.find(params[:id]) 
    end
    
    private
    def strong_params
        params.require(:bar).permit(:name,:address,:phone_number)
    end

    def find_bar
        @bar = Bar.find(params[:id])
    end 
end