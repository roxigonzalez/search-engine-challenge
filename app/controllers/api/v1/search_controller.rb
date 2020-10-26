module Api
	module V1
		class SearchController < ApplicationController

			def index
				@results = SearchEngine.new(search_params[:q], search_params[:engine]).call
			end

			protected 

			def search_params
				params.permit(:q, :engine)
			end
		end
	end
end