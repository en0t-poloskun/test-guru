# frozen_string_literal: true

class Admin
  class TestsController < Admin::BaseController
    before_action :find_test, only: %i[show edit update destroy start]

    def index
      @test = Test.all
    end

    def show; end

    def new
      @test = Test.new
    end

    def edit; end

    def create
      @test = current_user.created_tests.new(test_params)
      if @test.save
        redirect_to @test
      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_to @test
      else
        render :edit
      end
    end

    def destroy
      @test.destroy!
      redirect_to admin_tests_path
    end

    private

    def find_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:name, :level, :category_id)
    end
  end
end
