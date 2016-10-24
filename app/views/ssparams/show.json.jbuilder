json.success true
json.ssparam do 
	json.id @ssparam._id 
	json.name @ssparam.name
	json.description @ssparam.description
	json.label @ssparam.label
	json.units @ssparam.units
	json.mandatory @ssparam.mandatory
	json.read_or_write @ssparam.read_or_write
	json.data_type @ssparam.data_type
	json.ssmodel do
		json.number @ssparam.ssmodel.number
		json.description @ssparam.ssmodel.description
		json.label @ssparam.ssmodel.label
	end
end