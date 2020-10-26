class Api::V1::SearchController < ApplicationController

	def index
		puts "hello"
		
	end

	protected 

	def search_params
		params.permit(:q, :engine)
	end
end