# frozen_string_literal: true

module Admins
  class BadgesController < Admins::BaseController
    def index
      @badges = Badge.all
    end
  end
end
