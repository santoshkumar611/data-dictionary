json.success true
json.ssparams @ssparams do |ssparam|
	json._id ssparam._id
	json.name ssparam.name
	json.label ssparam.label
	json.description ssparam.description
end