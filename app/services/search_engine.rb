class SearchEngine

	ENGINE_OPT = %w[google bing both]

	def initialize(query, engine)
		@query  = query
		@engine = engine

	end


	def call
		@engine = @engine.to_s.downcase

		results = {
			google: [],
			bing: []
		}

		return results unless ENGINE_OPT.include? @engine

		results[:google] << GoogleSearch.new(@query).get_results if %w[google both].include? @engine

		results[:bing] << BingSearch.new(@query).get_results if %w[bing both].include? @engine
			
		results
	rescue => e 
		Rails.logger.info e.inspect
	end
end