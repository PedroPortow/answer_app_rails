class AdminsBackoffice::TestsController < AdminsBackofficeController
  before_action :set_test, only: [:edit, :update, :destroy]
  before_action :params_test, only: [:update]
  before_action :get_subjects, only: [:new, :edit]
  before_action :get_questions, only: [:new, :edit]
  
  def index
    console
    @tests = Test.all.includes(:subject).includes(:questions)
  end

  def edit
   
  end

  def new
    @test = Test.new
  end

  def update
    if @test.update(params_test)
      redirect_to admins_backoffice_tests_path, notice: "Teste atualizado com sucesso"
    else
      render :edit
    end
  end

  def create
    @test = Test.new(params_test)

    if @test.save
      redirect_to admins_backoffice_tests_path, notice: "Teste cadastrado com sucesso"
    else
      render :edit
    end
  end


  def destroy
    if @test.destroy
      redirect_to admins_backoffice_tests_path, notice: "Teste excluido com sucesso"
    else
      render :index
    end
  end

  private
  
    def set_test
      @test = Test.find(params[:id])
    end

    def params_test
      params.require(:test).permit(:description, :subject, :question, question_attributes: [:id, :description, :correct, :_destroy])
    end

    def get_subjects
      @subjects = Subject.all
    end

    def get_questions
      @questions = Question.all
    end

end

