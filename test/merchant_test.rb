require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test
	attr_reader :merchant

	def setup
		row = {:id => "1", :name => "Schroeder-Jerde", :created_at => "2012-03-27 14:53:59 UTC", :updated_at => "2012-03-27 14:53:59 UTC"}
		@engine = SalesEngine.new
		@engine.startup
		@merchant = Merchant.new(row, @engine.merchant_repository)
	end

	def test_it_exists
		assert Merchant
	end

	def test_returns_name_of_merchant
	  assert_equal "schroeder-jerde", merchant.name
	end

	def test_returns_id_of_mercahnt
		assert_equal "1", merchant.id
	end

	def test_returns_when_merchant_was_created
		assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
	end

	def test_returns_when_merchant_was_updated
		assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
	end

	def test_it_knows_what_items_are_associated_with_it
		assert_equal 15, merchant.items.size
	end

	def test_it_knows_what_invoices_are_associated_with_it
		assert_equal 59, merchant.invoices.size
	end

	def test_it_can_get_total_revenue
		assert_equal 565485, merchant.revenue
	end

	def test_it_can_get_total_revenue_with_stubs
		invoice = Minitest::Mock.new
		invoice_item = Minitest::Mock.new
		invoice_item_2 = Minitest::Mock.new
		invoice.expect :invoice_items, [ invoice_item, invoice_item_2 ]
		invoice_item.expect :unit_price, "5"
		invoice_item.expect :quantity, "1"
		invoice_item_2.expect :unit_price, "10"
		invoice_item_2.expect :quantity, "3"

		merchant.stub :invoices, [ invoice ] do
			assert_equal 35, merchant.revenue
		end
	end

end
