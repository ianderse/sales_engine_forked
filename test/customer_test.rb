require 'csv'
require_relative 'test_helper'
require_relative '../lib/csv_handler'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  attr_reader :customers, :customer

  def setup
    csv        = CsvHandler.new("./data/customers.csv")
    @customers = csv.data.collect {|row| Customer.new(row)}
    @customer = customers.first
  end

  def test_it_returns_a_first_name
    assert_equal "Joey", customer.first_name
  end

  def test_it_returns_a_last_name
    assert_equal "Ondricka", customer.last_name
  end

  def test_it_returns_an_id
    assert_equal "1", customer.id
  end

  def test_it_returns_an_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end

  def test_it_returns_created_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end

  def test_it_returns_all_associated_invoices
    skip
    assert_equal ??, customer .invoices
  end
end
