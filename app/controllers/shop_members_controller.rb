class ShopMembersController < ApplicationController
  #before_action :set_shop_member, only: [:show, :edit, :update, :destroy] 
  def index
    @shop_members = ShopMember.all
  end

  def show
    #@shop_member = ShopMember.find(params[:id])
  end

  # GET /shop_members/new
  def new
    @shop_member = ShopMember.new
  end


  # POST /shop_members
  # POST /shop_members.json
  def create
    @shop_member = ShopMember.new(shop_member_params)

      if @shop_member.save
         flash[:notice] = 'Created successfully'
         render :action => 'show'
      else
        render nothing: true
      end   
  end

  # PATCH/PUT /shop_members/1
  # PATCH/PUT /shop_members/1.json
  def update
    
      if @shop_member.update(shop_member_params)
        #format.html { redirect_to @shop_member, notice: 'Shop member was successfully updated.' }
        #format.json { render :show, status: :ok, location: @shop_member }
        render :action => 'show'
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
