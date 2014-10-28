class SessionsController < ApplicationController
  def new
  
  end

  def create
  	@shop_member = ShopMember.authenticate(params[:staff_email], params[:password])
		if @shop_member		
			flash[:alert] = "You've been logged in."		    
			session[:shop_member_id] = @shop_member.id
			#render shop_member_path    
      render "shop_members/show"
		else		
			flash[:alert] = "There was a problem logging you in."
			redirect_to login_path
		end
  end
    
  def destroy
  	session.clear
    flash[:notice] = "You've been logged out successfully."
    redirect_to login_path 
    #render login_path
  end
end
