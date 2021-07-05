# frozen_string_literal: true

module Admins
  class GistsController < Admins::BaseController
    def index
      @gist = Gist.all
    end
  end
end
