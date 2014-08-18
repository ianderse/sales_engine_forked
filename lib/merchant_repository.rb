require 'csv'
require_relative "merchant"
require_relative "../lib/csv_handler"

class MerchantRepository
	attr_reader :merchants

  def initialize
    csv      = CsvHandler.new("./data/merchants.csv")
    @merchants = csv.data.collect {|row| Merchant.new(row)}
  end

  def all
  	merchants
  end

  def random
  	merchants.sample
  end

  def find_by(type, query)
  	  merchants.detect {|merchant| merchant.send(type.downcase.to_sym) == query.downcase}
  end

  def find_all_by(type, query)
  	merchants.select {|merchant| merchant.send(type.downcase.to_sym) == query.downcase}
  end

  def items
  	
  end
end