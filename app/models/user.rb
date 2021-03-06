class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :user_interests
  has_many :interests, through: :user_interests 
  has_many :requests
  has_many :request_applies
  has_many :request, through: :request_applies    

  def self.find_for_facebook_oauth(auth)
     user = User.where(provider: auth.provider, uid: auth.uid).first
     # The User was found in our database
     return user if user

     # Check if the User is already registered without Facebook
     user = User.where(email: auth.info.email).first
     return user if user
     
     User.create(
       name: auth.extra.raw_info.name,
       provider: auth.provider, uid: auth.uid,
       email: auth.info.email,
       image: auth.info.image,
       password: Devise.friendly_token[0,20])
   end
  
  
end
