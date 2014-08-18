require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
	attr_reader :merchant_repository

	def setup
		@merchant_repository = MerchantRepository.new
	end

	def test_it_returns_all_instances_of_merchant
		assert_equal 100, merchant_repository.all.count
	end

	def test_it_returns_a_random_merchant
		result = merchant_repository.random
		assert_instance_of Merchant, result
	end

	def test_it_finds_by_name
		results = merchant_repository.find_by("name", "Bechtelar LLC")
		assert_equal "bechtelar llc", results.name
	end

	def test_it_finds_by_id
		results = merchant_repository.find_by("id", "66")
		assert_equal "66", results.id
	end

	def test_it_finds_all_by
	  result = merchant_repository.find_all_by("name", "williamson group")
	  assert_equal 2, result.count
	end
end	