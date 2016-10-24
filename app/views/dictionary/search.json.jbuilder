json.success true
if params[:search_term].present?
	json.search_params @ssparams.each do |ssparam|
		json.id ssparam._id
		json.name  ssparam.name
		json.label ssparam.label
		json.description ssparam.description
		json.model do 
			json.id ssparam.ssmodel._id
			json.label ssparam.ssmodel.label 
		end
	end
	json.count @ssparams.count
else
	json.search_params @ssparams.each do |ssparam|
		json.id ssparam._id
		json.name ssparam.name
		json.description ssparam.description
	end
end