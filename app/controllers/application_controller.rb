class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authorize
    current_user.programs.include?(@program)
  end
end
