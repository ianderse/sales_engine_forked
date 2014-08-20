require_relative 'test_helper'
require_relative '../lib/transaction_repository'
require_relative '../lib/sales_engine'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :transactions

  def setup
    @transactions = TransactionRepository.new(SalesEngine.new)
  end

  def test_it_returns_all_items
    results = transactions.all
    assert_equal 5595, transactions.all.count
  end

  def test_it_returns_a_random_element
    assert_instance_of Transaction, transactions.random
  end

  def test_it_finds_by_id
    results = transactions.find_by_id("1")
    assert_equal "1", results.invoice_id
  end

  def test_it_finds_by_invoice_id
    results = transactions.find_by_invoice_id("1")
    assert_equal "1", results.id
  end

  def test_it_finds_all_by_invoice_id
    results = transactions.find_all_by_invoice_id("12")
    assert_equal 3, results.size
  end

  def test_it_finds_by_credit_card_number
    results = transactions.find_by_credit_card_number("4654405418249632")
    assert_equal "1", results.id
  end

  def test_it_finds_all_by_credit_card_number
    results = transactions.find_all_by_credit_card_number("4654405418249632")
    assert_equal 1, results.size
  end

  # def test_it_finds_by_credit_card_expiration
  #   skip
  #   results = transactions.find_by_credit_card_expiration("05/06")
  #   assert_equal nil, results.id
  # end
  #
  # def test_it_finds_all_by_credit_card_expiration
  #   skip
  #   results = transactions.find_all_by_credit_card_expiration("05/06")
  #   assert_equal 0, results.size
  # end

  def test_it_finds_by_result
    results = transactions.find_by_result("failed")
    assert_equal "11", results.id
  end

  def test_it_finds_all_by_result
    results = transactions.find_all_by_result("failed")
    assert_equal 947, results.size
  end

  def test_it_finds_by_created_at
    results = transactions.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "1", results.id
  end

  def test_it_finds_by_updated_at
    results = transactions.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "1", results.id
  end

  def test_it_finds_all_by_created_at
    results = transactions.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 2, results.size
  end

  def test_it_finds_all_by_updated_at
    results = transactions.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 2, results.size
  end

  def test_it_returns_all_successful_transactions
    assert_equal 4648, transactions.successful_transactions.count
  end

end
