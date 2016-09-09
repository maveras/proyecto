class RequestApply < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  #scope :changos, -> { where(animal_type: 1) }
  #scope :sorted, -> {order(:name)}
  #scope :tipo, ->(name) {where(animal_type_id: AnimalType.where("name = ?", name).take.id)}
  #scope :cinco, -> { order(:id => :desc).limit(5)}
  scope :apply_active, -> { where( state:1 ) }
  scope :apply_accepted, -> { where( state:2 ) }
  scope :apply_revoked, -> { where( state:3) }
  
  def self.get_active_number
  	return 2
  end

end
