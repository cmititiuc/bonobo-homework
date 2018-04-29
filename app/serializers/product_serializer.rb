class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :product_name, :product_image, :product_description
  has_many :variants
end
