class UsersBackoffice::UserTestsController < UsersBackofficeController
  before_action :set_test, only: [:new, :results]

  def index
    #@user_tests = current_user.user_tests
  end

  def create
    @user_test = UserTest.new(user_test_params)
    # @user_test.save!
   end


  def show
    #@user_test = UserTest.find(params[:id])
  end

  def new
   #@user_test = UserTest.new(test_id: params[:id])
  end

  def calculate

    redirect_to "/users_backoffice/tests/#{params[:id]}/user_tests/results"
  end

  def results

  end



  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_questions
   
  end

end
