class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :product_name, :product_image, :product_description

  attribute :variants do |object|
    object.variants.map do |v|
      { waist: v.waist, length: v.length, style: v.style, count: v.count }
    end
  end
end
