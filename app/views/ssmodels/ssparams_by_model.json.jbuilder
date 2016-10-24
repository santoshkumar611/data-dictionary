json.success true
json.ssparams @ssparams do |ssparam|
	json.id ssparam._id
	json.name ssparam.name
	json.label ssparam.label
	json.description ssparam.description
end
json.count @ssparams.size