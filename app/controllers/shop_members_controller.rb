require "#{Rails.root}/lib/define" 

class ShopMembersController < ApplicationController
  #before_action :set_shop_member, only: [:show, :edit, :update, :destroy] 
 # before_filter :

  #def get_gui
   # if request.post?
    #  language = params[:language] ? params[:language] : default_locale
      #sessions[language]
  #end
  
  def test
   puts $default_language
  end
  
  def index
    @shop_members = ShopMember.all
    if @shop_members.empty?
      return nil      
    end
    #add debug 
    #logger.debug @shop_members.inspect
  end

  def show
    #@shop_member = ShopMember.find(params[:id])
  end

  # GET /shop_members/new
  def new
    @shop_member = ShopMember.new
  end 

  #add func
  def test
    @shop_members = ShopMember.where(staff_email: true,:staff_email => "hanh@gmail.com")
    #@shop_members = ShopMember.where(["staff_email = ?",true])
  end

  def create
    @shop_member = ShopMember.new(shop_member_params)

    # add debug
    #logger.debug "New member: #{@shop_member.attributes.inspect}"
    #logger.debug "Should valid: #{@shop_member.valid?}"

      if @shop_member.save #insert sql into DB        
         flash[:notice] = "Created successfully"
         #render :action => 'show'
         redirect_to shop_member_path(@shop_member)
      else
        render nothing: true
      end   
  end

  def update
    
      if @shop_member.update(shop_member_params)
        #format.html { redirect_to @shop_member, notice: 'Shop member was successfully updated.' }
        #format.json { render :show, status: :ok, location: @shop_member }
        render :action => 'show', status: :ok
      else
        #format.html { render :edit }      
        render json: @shop_member.errors, status: :unprocessable_entity
      end
    
  end

  private

    def shop_member_params
      params.require(:shop_member).permit(:staff_name, :staff_email, :password, :password_confirmation)
    end
end
