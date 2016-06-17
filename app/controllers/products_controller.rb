class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
		@product = Product.find(params[:id])

		if !current_cart.items.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
		else
			flash[:warning] = "你的購物車內已有此物品"
		end

		redirect_to :back
	end

	helper_method :current_cart

	def current_cart
		@current_cart ||= find_cart
	end

	private

	def find_cart
		cart = Cart.find_by(id: session[:cart_id])

		unless cart.present?
			cart = Cart.create
		end

		session[:cart_id] = cart.id
		cart
	end
end
