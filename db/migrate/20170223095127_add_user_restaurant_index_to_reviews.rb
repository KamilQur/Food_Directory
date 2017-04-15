class AddUserRestaurantIndexToReviews < ActiveRecord::Migration
  def change
  	add_reference :reviews,:restaurant,index:true
  	add_reference :reviews,:user,index:true 

  end
end
