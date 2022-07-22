class UsersBackoffice::UserTestsController < UsersBackofficeController
  before_action :set_test, only: [:new, :results, :show]
  before_action :set_user_test, only: [:results, :show]

  def new
    if current_user.test_ids.include?(params[:test_id].to_i) #verificar se usuario ta tentando entrar pela url
      redirect_to "/users_backoffice/tests/#{params[:test_id]}/user_tests/show"
    end
    
    @user_test = current_user.user_tests.new
    @user_test.user_test_answers.new
   end

  def create 
    @user_test = current_user.user_tests.new(params_test)

    if  @user_test.save
      @user_test.grade = UserTest.calc_grade(current_user.id, params[:test_id])
      redirect_to "/users_backoffice/tests/#{params[:test_id]}/user_tests/results"
    else
      render :new
    end
   end

  def results

  end

  def show
    @test_answers = UserTest.search_test_answers(current_user.id, params[:test_id])
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_user_test
    @user_test = UserTest.find_by(test_id: params[:test_id])
  end

  def params_test
    params.require(:user_test).permit(:test_id, user_test_answers_attributes: [:answer_id])
  end

end
