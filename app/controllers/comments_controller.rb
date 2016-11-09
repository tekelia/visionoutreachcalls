class CommentsController < ApplicationController

	def create
		@call = Call.find(params[:call_id])
		@comment = @call.comments.create(params[:comment].permit(:name, :body))

		redirect_to call_path(@call)
	end

	def destroy
		@call = Call.find(params[:call_id])
		@comment = @call.comments.find(params[:id])
		@comment.destroy

		redirect_to call_path(@call)
	end
end
