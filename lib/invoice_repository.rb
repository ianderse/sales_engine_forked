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

	def find_by_id(id)
		invoices.detect {|invoice| invoice.id == id}
	end

	def find_by_customer_id(customer_id)
		invoices.detect {|invoice| invoice.customer_id == customer_id}
	end

	def find_by_merchant_id(merchant_id)
		invoices.detect {|invoice| invoice.merchant_id == merchant_id}
	end

  def find_by_status(status)
		invoices.detect {|invoice| invoice.status == status}
	end

	def find_by_created_at(created_at)
		invoices.detect {|invoice| invoice.created_at == created_at}
	end	

	def find_all_by_id(id)
		invoices.select {|invoice| invoice.id == id}
	end

	def find_all_by_customer_id(customer_id)
		invoices.select {|invoice| invoice.customer_id == customer_id}
	end

	def find_all_by_merchant_id(merchant_id)
		invoices.select {|invoice| invoice.merchant_id == merchant_id}
	end

	def find_all_by_status(status)
		invoices.select {|invoice| invoice.status == status}
	end

	def find_all_by_created_at(created_at)
		invoices.select {|invoice| invoice.created_at == created_at}
	end
end