class Ssmodel
  include Mongoid::Document
  field :number,type: Integer
  field :description,type: String
  field :label,type: String
  
  has_many :ssparams
  validates :number,presence: true
  validates :label,presence: true  
end
