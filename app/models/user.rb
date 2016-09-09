class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_interests
  has_many :interests, through: :user_interests 
  has_many :requests
  has_many :request_applies
  has_many :request, through: :request_applies  

  def activities
  	requests
  	.active_requests
	.joins(:request_applies)
	.where("request_applies.state = ?",1)
  end


end
