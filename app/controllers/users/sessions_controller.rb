# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      flash[:notice] = t('.success', firstname: current_user.firstname, lastname: current_user.lastname)
    end
  end
end
