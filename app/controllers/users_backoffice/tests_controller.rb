class UsersBackoffice::TestsController < UsersBackofficeController

  def index
    @tests = Test.all.includes(:subject).includes(:questions)
    @current_user_tests = current_user.user_tests.to_a
    #@test_submission_time = UserTest.get_test_submission_timestamps(current_user.id)
  end

end