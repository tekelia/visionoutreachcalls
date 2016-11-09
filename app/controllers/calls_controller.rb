class CallsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]	
	def index
		@calls = Call.all.order('created_at DESC')
	end

	def show
		@call = Call.find(params[:id])
	end

	def new
		@call = Call.new
	end

	def create
		@call = Call.new(call_params)
		
		if @call.save 
			redirect_to @call
		else
			render 'new'
		end
	end	

	def edit
		@call = Call.find(params[:id])

	end

	def update
		@call = Call.find(params[:id])

		if @call.update(params[:call].permit(:name, :phone, :email, :address, :city, :zip,:appt_date,:appt_time, :income))
			redirect_to @call
		else
			render 'edit'
		end
	end

	def destroy
		@call = Call.find(params[:id])
		@call.destroy
		
		redirect_to root_path
	end

	private

		def call_params
			params.require(:call).permit(:name, :phone, :email, :address, :city, :zip,:appt_date,:appt_time, :income)
		end
end

