class Ssparam
  include Mongoid::Document
  include Mongoid::Search
  field :name,type: String
  field :label, type: String
  field :description, type: String
  field :mandatory, type: Boolean
  field :units, type: String
  field :read_or_write,type: String
  field :data_type,type: String

  belongs_to :ssmodel
  validates :name,presence: true
  
  # The following method for implement has_many :through relation
  # def ssmodels
  # 	Ssmodel.in(id: ssmodel_params.pluck(:ssmodel_id))
  # end
  search_in :name,:label,:ssmodel=>[:label]
  # searchkick
  # def search_data
  #   return {
  #     name: name,
  #     label: label,
  #     model_label: ssmodel.label,
  #     model_number: ssmodel.number
  #   }
  # end
end
