namespace :ssmodel_data do
  require "google_drive"
  
  task google_sheets_accessing: :environment do 
  	creds = {
  		"client_id": "312900667824-b7g4pk6t9002e1hbf49tsh7654mgokml.apps.googleusercontent.com",
  		"client_secret": "Fx88k1FIa1vRCSz4sQKDaTrQ"
  	}
  	session = GoogleDrive::Session.from_config("config.json")
		ws = session.spreadsheet_by_key("1JDY2iZQumi2VYvagozT145yIBMOcP_1mUBwEF-abKAY").worksheets
  	ws.each do |worksheet|
      if worksheet.title == "Index"
        worksheet.rows.each_with_index do |w_row,i|
          if i != 0
            if w_row.count("") == w_row.count
              puts "row empty"
            else
              puts "#{w_row[0]}--#{w_row[1]}--#{w_row[2]}"
              Ssmodel.create(number:w_row[0],description:w_row[2],label:w_row[1])
            end
          end
        end
      end
  		
      if worksheet.title.to_i > 0
  			ssmodel_id = Ssmodel.find_by(number: worksheet.title.to_i)._id
  			worksheet.rows.each_with_index do |w_row,i|
  			 	if i != 0
  			 		if w_row.count("") == w_row.count
  			 			puts "row empty"
  			 		else
	  		 	    Ssparam.create(name: w_row[5],ssmodel_id: ssmodel_id,label: w_row[6],data_type: w_row[8],
	  		 				units: w_row[9],read_or_write: w_row[11],mandatory: w_row[12] == "M",description: w_row[13])
	  				end
  			 	end
  			end
  		end
  	end
  end

end
