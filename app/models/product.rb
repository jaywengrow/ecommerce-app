class Product < ActiveRecord::Base

	has_many :categorized_products
	has_many :categories, :through => :categorized_products
	has_many :carted_products
	has_many :orders, :through => :carted_products
	has_many :orders
	has_many :product_photos
	has_many :product_options
	belongs_to :vendor

	validates :name, :presence => true
	validates :name, :uniqueness => true
	

	attr_accessor :product_options_list, :product_photos_list

	def friendly_price
		x = price.round(2)
		x = x.to_s
		x += "0" if x.split(".")[1].length == 1
		x = "$" + x
	
		return x

	end

	def sale_price
		if price > 30
			return "Sale Price"
		else price < 30
			return "DISCOUNT ITEM!"
	
		end
	end

	def sales_tax

		@tax = (price*0.09).round(2)
		x = @tax.to_s
		
		return "Sales Tax: $" + x 
		

	end

	def total_price

		z = @tax + price
		z = z.to_s
		return "Total Price: $" + z


	end
end

