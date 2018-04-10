class StocksController < ApplicationController
	def search
		if params[:stock].blank? 
			flash.now[:danger] = "You Must Enter A Stock Symbol"
		else
			@stock = Stock.new_from_lookup(params[:stock]) 
			flash.now[:danger] = "Invalid Stock Symbol" unless @stock
		end
		
		respond_to do |format|
			format.js { render partial: 'users/result' }
		end

	end
end