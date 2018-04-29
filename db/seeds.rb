require 'csv'

Product.destroy_all

# seed products
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
