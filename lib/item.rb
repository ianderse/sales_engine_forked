require 'bigdecimal'  # => true

class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at  # => nil

  def initialize(row)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new((row[:unit_price].to_f / 100).to_s)
    @merchant_id = row[:merchant_id]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end

  #validate data
end
