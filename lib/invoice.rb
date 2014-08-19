require 'csv'

class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at
 def initialize(row, repo)
 	  @id          = row[:id]
 	  @customer_id = row[:customer_id]
 	  @merchant_id = row[:merchant_id]
 	  @status      = row[:status]
 	  @created_at  = row[:created_at]
 	  @updated_at  = row[:updated_at]
    @repo        = repo
 	end

  def transactions
    @repo.engine.transaction_repository.find_all_by_invoice_id(self.id)
  end

  def invoice_items
    @repo.engine.invoice_item_repository.find_all_by_invoice_id(self.id)
  end

  def items

  end

  def customer
    @repo.engine.customer_repository.find_by_id(self.customer_id)
  end
  
  #validate data
end
