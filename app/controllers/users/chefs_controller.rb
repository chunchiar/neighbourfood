class Users::ChefsController < ApplicationController

  before_action :authenticate_user!
  before_action :checkifchef

  def index

  end

  private

  def checkifchef
    unless current_user&.chef?
      redirect_to root_path
    end
  end

end
