class InitialSchema < ActiveRecord::Migration
  def change

  create_table :restaurants do |t|
   t.string :name
   t.text   :description
   t.string :address
   t.string :city
   t.string :zipcode
   t.string :phone
   t.string :email 
  end 

 create_table :reviews do |t|
  t.string  :comment
  t.integer :rating
 end 

create_table :categories do |t|
 t.string :name 	
end 	



  end
end
