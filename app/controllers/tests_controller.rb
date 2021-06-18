# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    @test = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, :level, :category_id)
  end
end
