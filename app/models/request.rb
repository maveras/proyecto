class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest
  has_many :request_applies
  has_many :users, through: :request_applies 

  scope :active_requests, -> { where( state_request:1 ) }  

 end
