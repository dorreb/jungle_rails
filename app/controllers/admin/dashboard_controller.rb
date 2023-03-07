class Admin::DashboardController < ApplicationController

  before_action :authenticate_admin!

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME_KEY'], password: ENV['ADMIN_PASSWORD_KEY']

  def show
  end

  private
  
  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME_KEY'] && password == ENV['ADMIN_PASSWORD_KEY']
    end
  end

end
