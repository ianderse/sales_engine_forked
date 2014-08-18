require 'csv'
require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  attr_reader :sample

  def setup
    data = CSV.open("./data/customers.csv", headers: true, header_converters: :symbol)
    @sample = data.collect {|row| Customer.new(row)}
  end

  def test_it_returns_a_first_name
    assert_equal "Joey", sample.first.first_name
  end

  def test_it_returns_a_last_name
    assert_equal "Ondricka", sample.first.last_name
  end

  def test_it_returns_an_id
    assert_equal "1", sample.first.id
  end

  def test_it_returns_a_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", sample.first.created_at
  end

  def test_it_returns_created_at
    assert_equal "2012-03-27 14:54:09 UTC", sample.first.created_at
  end
end
