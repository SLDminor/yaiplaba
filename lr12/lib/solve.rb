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
  
    def number
      params[:number]
    end
  
    def execute
      record = CalculationResult.find_by number: number
  
      return record if record
      result = solve
      persist(result)
    end
  
    def solve
      number = Integer(self.number)
      number.to_s(2).reverse.to_i(2)
    rescue StandardError
      'Некорректный ввод'
    end
  
    def persist(solved)
      result = solve
      CalculationResult.create(
        number: number,
        result: result
      )
    end
  end
  