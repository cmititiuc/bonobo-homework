class Product < ApplicationRecord
  has_many :variants, :dependent => :destroy

  def self.search(term)
    query = "MATCH (product_name) AGAINST (?) OR product_name LIKE ?"
    results = where(query, term, "%#{term.split(' ').join('%')}%")
    ActiveRecord::Associations::Preloader.new.preload(results, [:variants])
    results
  end
end
