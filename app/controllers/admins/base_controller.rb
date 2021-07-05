# frozen_string_literal: true

module Admins
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_required!

    private

    def admin_required!
      redirect_to root_path, alert: t('admins.access_failure') unless current_user.is_a?(Admin)
    end
  end
end
