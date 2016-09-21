class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest
  has_many :request_applies
  has_many :users, through: :request_applies 
  has_many :comments

  scope :active_requests, -> { where( state_request:1 ) }  
  scope :accepted_requests, -> { where( state_request:2 ) }  
  scope :active_canceled_requests, -> { where( state_request:3 ) }  
  scope :active_taked_requests, -> { where( state_request:4 ) }  

  #attr_accessor :hour_begin, :hour_end

  before_create :agrega_estado_activo

  def self.all_interesting_request(current_user)
    Request.all.includes(:user)
          .where.not(user_id: current_user.id)
          .joins(:interest)
          .where(interest_id:   
            current_user.interests.pluck("interests.id")
          )
  end

  def self.all_includes_user
    Request.all.includes(:user)
  end


  def self.get_active_request_number
  	return 1
  end

  def self.get_accepted_request_number
  	return 2
  end

  def self.get_canceled_request_number
  	return 3
  end

  def self.get_taked_request_number
  	return 4
  end

  private
    def agrega_estado_activo
      self.state_request = 1
    end

 end
