class Product < ApplicationRecord
  has_many :variants, :dependent => :destroy

  def self.search(term)
    product = includes(:variants).find_by(product_name: term)
    unless product
      results = where('MATCH (product_name) AGAINST (?)', term)
      ActiveRecord::Associations::Preloader.new.preload(results, [:variants])
      product = results.first
    end
    product
  end
end
