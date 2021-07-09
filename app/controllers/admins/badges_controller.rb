# frozen_string_literal: true

module Admins
  class BadgesController < Admins::BaseController
    before_action :set_badge, only: %i[show]

    def index
      @badges = Badge.all
    end

    def show; end

    private

    def set_badge
      @badge = Badge.find(params[:id])
    end
  end
end
