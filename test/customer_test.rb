require 'csv'
require_relative 'test_helper'
require_relative '../lib/csv_handler'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  attr_reader :customers

  def setup
    csv        = CsvHandler.new("./data/customers.csv")
    @customers = csv.data.collect {|row| Customer.new(row)}
  end

  def test_it_returns_a_first_name
    assert_equal "Joey", customers.first.first_name
  end

  def test_it_returns_a_last_name
    assert_equal "Ondricka", customers.first.last_name
  end

  def test_it_returns_an_id
    assert_equal "1", customers.first.id
  end

  def test_it_returns_an_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", customers.first.created_at
  end

  def test_it_returns_created_at
    assert_equal "2012-03-27 14:54:09 UTC", customers.first.created_at
  end
end
