require 'bigdecimal'

class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :repo

  def initialize(row, repo)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new((row[:unit_price].to_f / 100).to_s)
    @merchant_id = row[:merchant_id]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo = repo
  end

  #validate data

  def invoice_items
    repo.find_invoice_items_by_item_id(self.id)
  end

  def merchant
    repo.find_merchant_by_merchant_id(self.merchant_id)
  end

end
