class ClinicsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]	
	def index
		@clinics = Clinic.all.order('created_at DESC')
	end

	def show
		@clinic = Clinic.find(params[:id])
	end

	def new
		@clinic = Clinic.new
	end

	def create
		@clinic = Clinic.new(clinic_params)
		
		if @clinic.save 
			redirect_to @clinic
		else
			render 'new'
		end
	end	

	def edit
		@clinic = Clinic.find(params[:id])

	end

	def update
		@clinic = Clinic.find(params[:id])

		if @clinic.update(params[:clinic].permit(:date))
			redirect_to @clinic
		else
			render 'edit'
		end
	end

	def destroy
		@clinic = Clinic.find(params[:id])
		@clinic.destroy
		
		redirect_to root_path
	end

	private

		def clinic_params
			params.require(:clinic).permit(:date)
		end
end
