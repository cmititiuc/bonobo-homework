require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products/search" do
    it 'returns ok response' do
      get products_search_path

      expect(response).to have_http_status(200)
    end

    it 'returns all products when search term is empty' do
      get products_search_path(q: '')

      expect(get_product_names(response.body)).to match_array(
        ['washed chinos', 'jetsetter jeans', 'travel jeans', 'fireside flannels']
      )
    end

    it "returns correct products when only 1 word matches" do
      get products_search_path(q: 'washed chimps')

      expect(get_product_names(response.body)).to match_array(['washed chinos'])
    end

    it "returns correct products when multiple records match" do
      get products_search_path(q: 'jeans')

      expect(get_product_names(response.body)).to match_array(
        ['jetsetter jeans', 'travel jeans']
      )
    end

    it "returns correct products with partial search term" do
      get products_search_path(q: 'wash')

      expect(get_product_names(response.body)).to match_array(['washed chinos'])
    end

    it "returns nothing when no matches" do
      get products_search_path(q: 'blah')

      expect(get_product_names(response.body)).to eq([])
    end
  end
end

def get_product_names(response)
  JSON.parse(response)['data'].map do |result|
    result['attributes']['product_name']
  end
end
