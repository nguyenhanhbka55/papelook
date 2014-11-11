class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_shop_member
    	@current_shop_member ||= ShopMember.find(session[:shop_member_id]) if session[:shop_member_id]    	
  end

  def signed_in?
  	!current_shop_member.nil?
  end
  
  helper_method :current_shop_member
  helper_method :signed_in?
  @language = 'jp'  
end
