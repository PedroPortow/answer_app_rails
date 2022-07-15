class UsersBackoffice::TestsController < UsersBackofficeController
  before_action :set_test, only: [:make] 
  before_action :set_questions, only: [:make]
  
  def index
    @tests = Test.all.includes(:subject).includes(:questions)
  end
  
  def make
  
  end

  def check
    redirect_to users_backoffice_tests_path
  end

  def show
    # ação pra mostrar a prova
  end


  private

  def set_questions
    @questions = @test.questions.to_a
  end
  def set_test
    @test = Test.find(params[:id])
  end

  def params_test
    params.require(:test).permit(:subject_id, :id)
  end
end
