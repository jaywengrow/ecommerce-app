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

	mount_uploader :photo, ProductPhotoUploader
	
	attr_accessor :product_options_list, :product_photos_list

	def sale_message
		if price >= 30
			return "Sale!"
		elsif price < 30
			return "DISCOUNT ITEM!"
		end
	end

	def sales_tax
		return (price * 0.09).round(2)
	end

	def total_price
		return (price + sales_tax).round(2)
	end
end

