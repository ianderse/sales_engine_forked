require 'csv'
require_relative 'csv_handler'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers

  def initialize
    csv       = CsvHandler.new("./data/customers.csv")
    @customers = csv.data.collect {|row| Customer.new(row)}
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by(type, query)
    customers.detect {|customer| customer.send(type.downcase.to_sym) == query}
  end

  def find_all_by(type, query)
    customers.select {|customer| customer.send(type.downcase.to_sym) == query}
  end
end
