require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products/search" do
    it "returns correct product" do
      get products_search_path(q: 'washed chimps')

      returned_product_name =
        JSON.parse(response.body)['data']['attributes']['product_name']

      expect(response).to have_http_status(200)
      expect(returned_product_name).to eq('washed chinos')
    end
  end
end
