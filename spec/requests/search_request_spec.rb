require "rails_helper"

RSpec.describe SearchController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
      expect(reponse.content_type).to eq  "application/json"
    end

    it "has a JSON with google results" do 
      get :index, params: { q: 'ruby on rails', engine: 'google' }
      expect(response.status).to eq(200)
      expect(reponse.content_type).to eq  "application/json"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['google']).to_not be_nil
      expect(parsed_response['bing']).to be_nil
    end

    it "has a JSON with bing results" do 
      get :index, params: { q: 'ruby on rails', engine: 'bing' }
      expect(response.status).to eq(200)
      expect(reponse.content_type).to eq  "application/json"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['google']).to be_nil
      expect(parsed_response['bing']).to_not be_nil
    end

    it "has a JSON with bing and google results" do 
      get :index, params: { q: 'ruby on rails', engine: 'both' }
      expect(response.status).to eq(200)
      expect(reponse.content_type).to eq  "application/json"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['google']).to_not be_nil
      expect(parsed_response['bing']).to_not be_nil
    end

    it "has empty results" do 
      get :index, params: { q: 'ruby on rails', engine: '110192la' }
      expect(response.status).to eq(200)
      expect(reponse.content_type).to eq  "application/json"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['google']).to be_nil
      expect(parsed_response['bing']).to be_nil
    end

  end


end
