class CalculationResult < ApplicationRecord
  validates :query, uniqueness: true, presence: true
end
