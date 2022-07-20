class UsersBackoffice::TestsController < UsersBackofficeController

  def index
    @tests = Test.all.includes(:subject).includes(:questions)
    @user = User.find(current_user.id) # n precisa? 
    # @grade = UserTest.get_grades(current_user.id)
    @test_submission_time = UserTest.get_test_submission_timestamps(current_user.id)
  end

end