require "#{Rails.root}/lib/solve"

class CalculationController < ApplicationController
  def input; end

  def view
    @result = Solve.call(params)
  end
end
