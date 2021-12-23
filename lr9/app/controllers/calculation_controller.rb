class CalculationController < ApplicationController
  def input; end

  def view
    query = Integer(params[:query])
    result = query.to_s(2).reverse.to_i(2)
    render json: {query: query, result: result}
  rescue StandardError
    render json: {error: 'Некорректный ввод'}
  end
end
