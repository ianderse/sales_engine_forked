require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :customers

  def setup
    @customers = CustomerRepository.new
  end

  def test_it_returns_all_items
    results = customers.all
    assert_equal 4843, customers.all.count
  end

  def test_it_returns_a_random_element
    assert_instance_of Customer, customers.random
  end

  def test_you_can_find_by_id
    results = customers.find_by("id", "30")
    assert_equal "Item Eos Quia", results.first_name
  end

  def test_you_can_find_by_first_name
    results = customers.find_by("first_name", "Joey")
    assert_equal "101", results.id
  end

  def test_you_can_find_by_last_name
    results = customers.find_by("last_name", "Ondricka")
    assert_equal "101", results.id
  end

end
