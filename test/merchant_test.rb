require_relative 'test_helper'


class MerchantTest < Minitest::Test
	attr_reader :merchant

	def setup
		row = {:id => "1", :name => "Schroeder-Jerde", :created_at => "2012-03-27 14:53:59 UTC", :updated_at => "2012-03-27 14:53:59 UTC"}		
		@merchant = Merchant.new(row)
	end

	def test_it_exists
		assert Merchant
	end

	def test_returns_name_of_merchant
	  assert_equal "Schroeder-Jerde", merchant.name	
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
  
end	