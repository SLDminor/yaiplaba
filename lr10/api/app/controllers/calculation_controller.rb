class CalculationController < ApplicationController
  def input
    query = Integer(params[:query])
    result = query.to_s(2).reverse.to_i(2)
    render xml: { query: query, result: result }
  rescue StandardError
    render xml: { error: 'Некорректный ввод' }
  end
end
