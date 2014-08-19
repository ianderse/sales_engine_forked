require 'csv'
require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/csv_handler'

class TransactionTest < Minitest::Test
  attr_reader :sample

  def setup
    csv = CsvHandler.new("./data/transactions.csv")
    @sample = csv.data.collect {|row| Transaction.new(row)}
  end

  def test_it_returns_an_id
    assert_equal "1", sample.first.id
  end

  def test_it_returns_an_invoice_id
     assert_equal "1", sample.first.invoice_id
  end

  def test_it_returns_a_credit_card_number
    assert_equal "4654405418249632", sample.first.credit_card_number
  end

  def test_it_returns_a_credit_card_expiration_date
    assert_equal nil, sample.first.credit_card_expiration
  end

  def test_it_returns_a_created_at_date
    assert_equal "2012-03-27 14:54:09 UTC", sample.first.created_at
  end

  def test_it_returns_an_updated_at_date
    assert_equal "2012-03-27 14:54:09 UTC", sample.first.updated_at
  end
end
