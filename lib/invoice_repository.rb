require 'csv'
require_relative 'invoice'
require_relative '../lib/csv_handler'

class InvoiceRepository
	attr_reader :invoices
	
	def initialize
		csv      = CsvHandler.new("./data/invoices.csv")
		@invoices = csv.data.collect {|row| Invoice.new(row)}
	end

	def all
		invoices
	end

	def random
		invoices.sample
	end

	def find_by(type, query)
		invoices.detect {|invoice| invoice.send(type.downcase.to_sym) == query}
	end

	def find_all_by(type, query)
		invoices.select {|invoice| invoice.send(type.downcase.to_sym) == query}
	end
end