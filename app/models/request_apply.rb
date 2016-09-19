class RequestApply < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  #scope :changos, -> { where(animal_type: 1) }
  #scope :sorted, -> {order(:name)}
  #scope :tipo, ->(name) {where(animal_type_id: AnimalType.where("name = ?", name).take.id)}
  #scope :cinco, -> { order(:id => :desc).limit(5)}
  scope :active_applies, -> { where( state:1 ) }
  scope :accepted_applies, -> { where( state:2 ) }
  scope :revoked_applies, -> { where( state:3) }
  
  before_create :agrega_estado_activo_apply
  
  def self.get_active_apply_number
  	return 1
  end

  def self.get_accepted_apply_number
    return 2
  end

  def self.get_revoked_apply_number
    return 3
  end

  private
    def agrega_estado_activo_apply
      self.state = 1
    end
end
