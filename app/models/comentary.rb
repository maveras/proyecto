class Comentary < ActiveRecord::Base
  belongs_to :user
  belongs_to :request_apply
end
