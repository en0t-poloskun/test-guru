# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      flash[:notice] = "Hello, #{current_user.firstname} #{current_user.lastname}!"
    end
  end
end
