class ApplicationController < ActionController::Base

  protect_from_forgery


  
  def after_sign_up_path_for(resource)
     show_deals_path(resource)
  end
end
