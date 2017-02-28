class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categoties

  private

  def set_categoties
  	@categories= Category.all
  end

end
