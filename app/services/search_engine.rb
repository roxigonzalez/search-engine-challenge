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

		results[:google] << if %w[google both].include? @engine
			GoogleSearch.new(@query).get_results
		else
			[]
		end

		results[:bing] << if %w[bing both].include? @engine
			BingSearch.new(@query).get_results
		end

		results
	rescue => e
		Rails.logger.info e.inspect
	end
end
