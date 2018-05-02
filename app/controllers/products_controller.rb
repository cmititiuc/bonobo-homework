class ProductsController < ApplicationController
  def search
    products = ProductSerializer.new(Product.search(params[:q])).serialized_json

    render json: products
  end
end
