class VariantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :waist, :length, :style, :count
end
