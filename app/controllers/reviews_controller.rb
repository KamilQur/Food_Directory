class ReviewsController < ApplicationController

before_action :authenticate_user!, only: [:new,:create,:edit,:destroy] 


def new 
 @restaurant = Restaurant.find(params[:restaurant_id])
 @review = Review.new(restaurant:@restaurant)
end

def create
 @restaurant = Restaurant.find(params[:restaurant_id])
 @review = current_user.reviews.build(review_params)
 @review.restaurant = @restaurant
 @review.save
 redirect_to restaurant_path(@restaurant)
end	

def show 
  @restaurant = Restaurant.find(params[:id]) 

end 	


private 
 def review_params
  params.require(:review).permit(:comment,:rating)
 end  	

	
end
