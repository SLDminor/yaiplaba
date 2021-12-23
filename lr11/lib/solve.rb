class Solve
  class << self
    def call(params)
      new(params).send :execute
    end
  end

  private

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def query
    params[:query]
  end

  def execute
    record = CalculationResult.find_by query: query

    return record if record

    result = solve
    persist(result)
  end

  def solve
    query = Integer(self.query)
    [query.to_s(2).reverse.to_i(2), false]
  rescue StandardError
    ['Некорректный ввод', true]
  end

  def persist(solved)
    result, error = solved
    CalculationResult.create(
      query: query,
      result: result,
      error: error
    )
  end
end
