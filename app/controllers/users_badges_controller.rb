# frozen_string_literal: true

class UsersBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.badges
    render 'badges/index'
  end
end
