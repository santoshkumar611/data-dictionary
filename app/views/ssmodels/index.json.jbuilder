json.success true
json.ssmodels @ssmodels do |ssmodel| 
	json.id ssmodel._id
	json.label ssmodel.label
	json.number ssmodel.number
	json.description ssmodel.description
end