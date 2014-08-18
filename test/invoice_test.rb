require 'csv'
require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
	attr_reader :invoices

	def setup
		csv = CSV.open("./data/invoices_test.csv", headers:  true, header_converters: :symbol)
    @invoices = csv.collect {|row| Invoice.new(row)}
	end

	def test_it_returns_id
		assert_equal "16", invoices.first.id
	end

	def test_it_returns_a_customer_id
		assert_equal "4", invoices.first.customer_id
	end

	def test_it_returns_merchant_id
		assert_equal "27", invoices.first.merchant_id
	end	
	
	def test_it_returns_status
		assert_equal "shipped", invoices.first.status
	end
	
	def test_it_returns_created_at
		assert_equal "2012-03-12 03:54:10 UTC", invoices.first.created_at
	end

	def test_it_returns_updated_at
		assert_equal "2012-03-12 03:54:10 UTC", invoices.first.updated_at
	end	
end