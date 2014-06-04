require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works" do 
  	assert_nothing_raised do
  	UserFriendship.create user: users(:michael), friend: users(:michaelthefrog)
  end
end

  test "that creating a friendship based on a user id and a friend id works" do
  	UserFriendship.create user_id: users(:mike).id, friend_id: users(:michaelthefrog).id
  	assert users(:mike).friends.include?(users(:michaelthefrog))
end

end