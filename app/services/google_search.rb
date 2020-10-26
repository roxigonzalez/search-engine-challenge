require 'google/apis/customsearch_v1'

class GoogleSearch 
  
  Customsearch = Google::Apis::CustomsearchV1 # Alias the module


	def initialize(query)
		@query = query
	end

  def get_results
    service = Customsearch::CustomSearchAPIService.new 
    service.key = ENV["GOOGLE_API_KEY"]
    results = service.list_cses({
      cx: ENV['GOOGLE_ID_CTX'],
      q: @query
    })

    results.items.map{ |i| {
        title: i.title, 
        link: i.link, 
        snippet: i.snippet
      } 
    } 
  rescue 
    []
  end
end