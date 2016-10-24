class SsparamsController < ApplicationController 
	
	def index
		@ssparams = Ssparam.where(ssmodel_id: nil)
	end

	def create_or_update
		if params[:ssparam][:name].present?
			if params[:ssparam][:_id].present?
				ssparam = Ssparam.find(params[:ssparam][:_id][:$oid])
				ssparam.update(ssparam_attributes)
				render :json=>{success: true,message: "ssparam updated"}
			else
				ssparam = Ssparam.create(ssparam_attributes)
				render :json=>{success: true,message: "ssparam created"}
			end
		else
			render :json=>{success: false,message: "ssparam name and label are required"}
		end
	
	end
	
	def delete
		if params[:id].present?
			Ssparam.find(params[:id]).delete
			render :json=>{success: true,message: "param deleted"}
		else
			render :json=>{success: false,message: "id of param required"}
		end
	end
	
	def show
		if params[:id].present? 			
			@ssparam = Ssparam.includes(:ssmodel).find(params[:id])
			# raise @ssmodel_param.inspect
		else
			render :json=>{success: true,message: "ssparam id is required"}
		end
	end

	def unassigned_params 
		@ssparams = Ssparam.where(ssmodel_id: nil)
	end
	
	private 

		def ssparam_attributes
			params.require(:ssparam).permit(:name,:label,:description,:units,:mandatory,:read_or_write,:data_type)
		end

end
