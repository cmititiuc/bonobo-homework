# seed products
Product.destroy_all
File.foreach('inventory_data/products.csv').with_index do |line, line_num|
   next if line_num == 0
   product_data = line.split("\",")

   product_name = product_data[1].gsub(/\"/, '')
   product_image = product_data[2].gsub(/\"/, '').strip
   product_description = product_data[3].gsub(/\"/, '').strip

   Product.create!(
     product_name: product_name,
     product_image: product_image,
     product_description: product_description,
   )
end

# seed inventory
Variant.destroy_all
products = Product.all
File.foreach('inventory_data/inventory.csv').with_index do |line, line_num|
  next if line_num == 0
  inventory_data = line.split(', ')

  product = products.find(inventory_data[0].to_i)
  waist   = inventory_data[1].to_i
  length  = inventory_data[2].to_i
  style   = inventory_data[3]
  count   = inventory_data[4].strip.to_i

  Variant.create!(
    product: product,
    waist: waist,
    length: length,
    style: style,
    count: count
  )
end
