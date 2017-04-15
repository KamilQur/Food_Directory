class RestaurantsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create] 


	def index 
	 # visitor_latitude = request.location.latitude
	 # visitor_longitude = request.location.longitude 
	 visitor_latitude = 31.582045
	 visitor_longitude = 74.329376	  
     @restaurants = Restaurant.near([visitor_latitude,visitor_longitude],30)
	end  



	def new 
      @restaurant = Restaurant.new 
	end 
	

	def create 
     @restaurant = Restaurant.new(restaurant_params)
     if @restaurant.save 
     redirect_to restaurant_path(@restaurant)		
     else 
      flash[:danger] = @restaurant.errors.full_messages.to_sentence	
      render 'new'
   end 
	end   

	def show 
     @restaurant = Restaurant.find(params[:id])
     @reviews = Review.where(restaurant_id: @restaurant) 
     
    end 	 	



	def edit  
     @restaurant = Restaurant.find(params[:id]) 

	end 

	def update 
     @restaurant = Restaurant.find(params[:id]) 
     @restaurant.update(restaurant_params)
     redirect_to restaurant_path(@restaurant)  
	end  


	def destroy  
     @restaurant = Restaurant.find(params[:id]) 
     @restaurant.destroy
     redirect_to root_path  
	end 

	def search 
		if params[:category].blank?
	   @restaurants = Restaurant.all 
	   else		
      @restaurants = Restaurant.search(params) 
  end 
	end 	



private 

def restaurant_params	 	
   params.require(:restaurant).permit(:name,:description,:address,:city,:zipcode,:phone,:email,:category_id,:state,:image)
	
end   




end
