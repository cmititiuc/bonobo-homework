class ProductsController < ApplicationController
  def search
    product =
      ProductSerializer
        .new(Product.search(params[:q]), { include: [:variants] })
        .serialized_json

    render json: product
  end
end
