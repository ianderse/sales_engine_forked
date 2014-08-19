class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(row, repo)
    @id          = row[:id]
    @name        = (row[:name]).downcase
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo        = repo
  end

  #validate data

  def items
    @repo.engine.item_repository.find_all_by_merchant_id(self.id)
  end

end
