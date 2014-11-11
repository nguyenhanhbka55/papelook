class ShopsController < ApplicationController

	#before_create :validate_shop_id
	def index
		redirect_to :action => 'shoplist'
	end		
	
	def shoplist	
		#check post request	
		if request.post?
			@deviceId=params[:deviceId] ? params[:deviceId] : ''			
			if(!params[:deviceId].nil?)
				@deviceId=params[:deviceId]
			else
				@deviceId= ""
			end			
		end

		if request.get?
			if(!params[:deviceId].nil?)
				@deviceId=params[:deviceId]
			else
				@deviceId = ""
			end			
		end

		@json_shop_detail = []
		#check @deviceId
		if @deviceId.blank?
			@json_shop_detail[]= 
				json.code :error
				json.message "syntax"
		end
		#get memberId
		@deviceId=Device.where('deviceId',deviceId)

		#get all other shops
		@shop = Shop.all
		#check shopStatus
		@shops.each do |i,shop|
			check = !params[:shopId].nil?
			if check
				@shopId=params[:shopId]
			else
				@shopId=''
			end
		end
		case 
			
		end
		#case ..when method post and get
		#case request
		#	when post
				#if request.post?
		#			post: params[:post][:deviceId]
					#@deviceId=params[:post][:deviceId]						
				#end
		#	when get
				#if request.get?
		#		@deviceId=params[:get][:deviceId]
				#end
			#	elsif request.get?
			#@deviceId=params[:deviceId]

		#end
	end # --end/ shoplist


	def new_shop		
		#@shop = Shop.new
	end

	def create_shop
		@shop= Shop.new(shop_params)
		@shopId=Shop.find(params[:shopId])
		if @shop.save && @shopId.nil
			flash[:notice] = "success"
			render :action => 'show'
		else
			render nothing: true
		end
	end
	
	def save_shop
		
	end

	def check_in
				
	end		
	private
	def shop_params
		params.require(:shop).permit(:shopId,:shopName,:shopName_jp,:shopNameFurigana,:shopAdd,:shopEmail,:shopTel,
										:shopUrl,:shopIconExt,:shopImageExt,:shopHeadline,:shopTestimonials,:country,:city,:shopIconBinary,:shopImgBinary,
										:shopRankIconBinary,:shopRate,
										:shopStatus,
										:shopFastCheckinLimit,
										:shopStartCheck,
										:specialCpLimitTime,
										:specialCpLoopLimitTime,
										:specialCpId,
										:noticeLimitPerDay,
										:noticeTxt)
	end
end
