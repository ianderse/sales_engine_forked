require 'csv'
require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/csv_handler'

class ItemTest < Minitest::Test
	attr_reader :sample
	
	def setup
	  csv = CsvHandler.new("./data/items.csv")
	  @sample = csv.data.collect {|row| Item.new(row)}
	end

	def test_it_returns_a_name
		assert_equal "Item Qui Esse", sample.first.name
	end

	def test_it_returns_an_id
		assert_equal "1", sample.first.id
	end

	def test_it_returns_a_big_decimal_object
		assert_instance_of BigDecimal, sample.first.unit_price
	end

	def test_it_returns_a_mercahnt_id
		assert_equal "1", sample.first.merchant_id
	end

	def test_it_returns_created_at
		assert_equal "2012-03-27 14:53:59 UTC", sample.first.created_at
	end
end