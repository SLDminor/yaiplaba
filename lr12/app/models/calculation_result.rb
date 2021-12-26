class CalculationResult < ApplicationRecord
    validates :number, uniqueness: true, presence: true
  end
  