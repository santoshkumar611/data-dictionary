class SsmodelsController < ApplicationController
	
	def index
		@ssmodels = Ssmodel.order_by(:number=> 'asc')
	end

	def model_labels
		render json: {success: true, ssmodels: Ssmodel.order_by(:label=> 'asc').pluck(:label)}
	end

	def create_or_update
		
		if ssmodel_attributes[:number].present? && ssmodel_attributes[:label].present?
			if params[:ssmodel][:id].present?
				@ssmodel = Ssmodel.find(params[:ssmodel][:id][:$oid])
				@ssmodel.update(ssmodel_attributes)
				render :json => {success: true,message: "model updated successfully"}
			else
				@ssmodel = Ssmodel.create(ssmodel_attributes)
				render :json => {success: true,message: "model created successfully"}
			end
		else
			render :json => {success: false,message: "number and label of model are required"}
		end
	end
	
	def delete
		if params[:id].present?	
			Ssmodel.find(params[:id]).delete
			render :json => {success: true,message: "model deleted successfully"}
		else
			render :json => {success: true,message: "id of model required"}
		end
	end
	
	def assign_params
		if params[:model_params][:ssmodel_id].present? && params[:model_params][:ssparam_id].present?
			# we can do the following code in another way but following way is for updating keywords in ssparam for
			# full text searching
			ssparam = Ssparam.find(params[:model_params][:ssparam_id])
			ssparam.update(ssmodel_id: params[:model_params][:ssmodel_id])
			render :json => {success:true,message: "param assigned to model"}
		else
			render :json => {success:false,message: "model id and param id required"}
		end 
	end

	def ssparams_by_model
		if params[:ssmodel].present?
			ssmodel = Ssmodel.find_by(label: params[:ssmodel])
			if ssmodel
				@ssparams = ssmodel.ssparams.offset(params[:offset]).limit(params[:limit])
			else
				render :json => {success: false, message: "model is not found , please provide existed model"}
			end 
		else
			render :json => {success:false,message: "ssmodel id required"}
		end
	end
	
	private 
		
		def ssmodel_attributes
			params.require(:ssmodel).permit(:number,:description,:label)
		end
end
