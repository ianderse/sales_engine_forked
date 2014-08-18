require 'bigdecimal'
require 'bigdecimal/util'
require 'csv'
require_relative '../lib/item'

class ItemRepository
	attr_reader :items

	def initialize
		csv = CSV.open("./data/items.csv", headers: true, header_converters: :symbol)
		@items = csv.collect {|row| Item.new(row)}
	end

	def all
		items
	end

	def random
		items.sample
	end

	def find_by(type, query)

    if type_unit_price?(type)
      unit_price(query)
		else  
		  items.detect {|item| item.send(type.downcase.to_sym) == query}
		end  
	end

	def type_unit_price?(type)
    type.downcase == "unit_price"
  end

  def unit_price(price)
  	 price = (price.to_f * 100.00).round.to_s
   	 cents = BigDecimal.new(price)
	   items.detect {|item| item.unit_price == cents}
  end
end