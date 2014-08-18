require 'csv'
require_relative 'invoice'

class InvoiceRepository
	attr_reader :invoices
	
	def initialize
		data      = CSV.open("./data/invoices.csv", headers: true, header_converters: :symbol)
		@invoices = data.collect {|row| Invoice.new(row)}
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