class Transaction
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration, :result, :created_at, :updated_at

  def initialize(row)
    @id          = row[:id]
    @invoice_id  = row[:invoice_id]
    @credit_card_number      = row[:credit_card_number]
    @credit_card_expiration  = row[:credit_card_expiration]
    @result      = row[:result]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end

  #validate data
end
