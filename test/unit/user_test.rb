require 'test_helper'

class UserTest < ActiveSupport::TestCase
   should have_many(:user_friendships)
   should have_many(:friends)



  test "a user should enter a first name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  	end

  test "a user should enter a last name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  	end

  test "a user should enter a profile name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  	end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:michael).profile_name
    
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
   end

   test "a user shoud have a profile name without spaces" do
   	  user = User.new(first_name: 'Michael', last_name: 'Wiss', email: '2michael.wiss@gmail.com')
   	  user.password = user.password_confirmation = '2knish7219' 
   	  
   	  user.profile_name = "My Profile With Spaces"

   	  assert !user.save
   	  assert !user.errors[:profile_name].empty?
   	  assert user.errors[:profile_name].include?("Must be formatted correctly.")
   	end

   	test " a user can have a correctly formatted profile name" do
   	 user = User.new(first_name: 'Michael', last_name: 'Wiss', email: '2michael.wiss@gmail.com')
   	 user.password = user.password_confirmation = '2knish7219' 

   	 user.profile_name = '2michael'
   	 assert user.valid?
   	end
    test " that no error is raised when trying to get to a user's friends list" do
      assert_nothing_raised do
      users(:mike).friends
  end
end
   test "that creating friendships on a user works" do
    users(:mike).friends << users(:michaelthefrog)
    users(:michaelthefrog).friends.reload
    assert users(:mike).friends.include?(users(:michaelthefrog))
  end
end


