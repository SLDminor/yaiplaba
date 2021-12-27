# frozen_string_literal: true

class ReverController < ApplicationController
  before_action :prepare_class_variables, only: :result_table

  def enter_form; end

  def result_table
    @numbers = get_rever
  end

  def get_rever
    if @number >= 0
      @numbers.push(@number)
      @numbers.push(@number.to_s(2))
      @numbers.push(@number.to_s(2).reverse)
      @numbers.push(@number.to_s(2).reverse.to_i(2))
    end
  end

  private

  def prepare_class_variables
    @number = params[:number].to_i
    @numbers = []
  end
end

