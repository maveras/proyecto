require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #test "user cant apply to his own request"
  #	user = users(:one)
  # 	user.requests.build(title:"cant touch this", description: "tu nu nu nu")
  # 	user.applies
  #end

  test "activities method must not have duplicated requests" do
  	assert_equal 2, users(:one).activities.count
  end

  test "request_state must be active" do
  	require 'pp'
  	assert_not_includes users(:one).activities.collect(&:state_request), 2
  end


end
