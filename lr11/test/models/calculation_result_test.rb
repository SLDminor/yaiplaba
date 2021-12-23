require 'test_helper'

class CalculationResultTest < ActiveSupport::TestCase
  test 'cannot create empty query' do
    assert_not CalculationResult.new.save
  end

  test 'cannot create duplicated query' do
    CalculationResult.create(query: '1', result: '1')
    count = CalculationResult.count
    CalculationResult.create(query: '1', result: '1')
    assert_equal count, CalculationResult.count
  end
end
