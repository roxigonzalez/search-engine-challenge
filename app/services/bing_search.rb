class BingSearch
  include HTTParty

  def initialize(query)
    @query  = query
    @options = { 
      q: @query,
      customconfig: ENV["BING_CONFIGURATION_ID"] 
    }
    
    @headers = {
      'Ocp-Apim-Subscription-Key': ENV['BING_KEY_SUBSCRIPTION']
    }

  end

  def get_results
    response = self.class.get(
      "https://api.cognitive.microsoft.com/bingcustomsearch/v7.0/search", 
      query: @options,
      headers: @headers
    )
    parsed_response = JSON.parse(response.body)
    results = parsed_response["webPages"]["value"].map{ |i| {
        title: i["name"], 
        link: i["url"], 
        snippet: i["snippet"]
      } 
    } 

    results 
  rescue 
    []
  end

end