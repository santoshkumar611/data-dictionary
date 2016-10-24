class DictionaryController < ApplicationController
	
	def search
    if params[:search_term].present?
     	@ssparams = Ssparam.includes(:ssmodel).full_text_search(params[:search_term]).limit(params[:limit]).offset(params[:offset])
      # q = params[:search_term] || "*"
      # meta = { include: [:ssmodel_params,:ssmodel_params => [:ssmodel]] }    
      # @ssparams = Ssparam.search(q, meta)  
      # @count = @ssparams.response["hits"]["total"]
      # puts @count    
    else
     	@ssparams = Ssmodel.find_by(label: params[:model]).ssparams.where(name: /^#{params[:alphabetic]}|\_#{params[:alphabetic]}/i)
    end
  end

end
