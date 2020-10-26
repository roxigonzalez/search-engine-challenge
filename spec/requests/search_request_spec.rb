require "rails_helper"

RSpec.describe Api::V1::SearchController, :type => :controller do
  describe "GET index", type: :request do

    before {
      get '/api/v1/search', params: { q: 'hello world', engine: 'both' }
    }
    it 'returns engines' do
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.size).to eq(2)
      expect(parsed_response['google']).to_not be_nil
      expect(parsed_response['bing']).to_not be_nil
    end
  end


end
