class Restaurant < ActiveRecord::Base

 has_many :reviews 
 belongs_to :category

 validates_presence_of :name 
 validates_presence_of :description
 validates_presence_of :address
 validates_presence_of :city
 validates_presence_of :state 
 validates_presence_of :zipcode
 validates_presence_of :phone
 validates_presence_of :email

geocoded_by :full_address 
after_validation :geocode 

  mount_uploader :image, ImageUploader   

def full_address
 [address,city,state,zipcode].join(', ') 
end 	

def self.search(params)
 restaurants = Restaurant.where(category_id: params[:category].to_i) 
 restaurants = restaurants.where("name like ? or description like ?","%#{params[:search]}%","%#{params[:search]}%") if params[:search].present?
 restaurants = restaurants.near(params[:location],20) if params[:location].present?
 return restaurants   
end 	


end
