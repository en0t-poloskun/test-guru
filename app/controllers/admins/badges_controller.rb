# frozen_string_literal: true

module Admins
  class BadgesController < Admins::BaseController
    before_action :set_badge, only: %i[show edit update destroy]

    def index
      @badges = Badge.all
    end

    def show; end

    def new
      @badge = Badge.new
    end

    def edit; end

    def create
      @badge = Badge.new(badge_params)

      if @badge.save
        redirect_to admins_badge_path(@badge)
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admins_badge_path(@badge)
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy!
      redirect_to admins_badges_path
    end

    private

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :image, :method, :argument)
    end
  end
end
