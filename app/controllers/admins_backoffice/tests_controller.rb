class AdminsBackoffice::TestsController < AdminsBackofficeController
  before_action :set_test, only: [:edit, :update, :destroy]
  before_action :params_test, only: [:update]
  
  def index
    @tests = Test.all.includes(:subject)
   
  end

  def edit
   
  end

  def update
  
    if @test.update(params_test)
      redirect_to admins_backoffice_tests_path, notice: "Teste atualizado com sucesso"
    else
      render :edit
    end
  end

  def create
    @test = test.new(params_test)

    if @test.save
      redirect_to admins_backoffice_tests_path, notice: "Teste cadastrado com sucesso"
    else
      render :edit
    end
  end

  def new
    @test = Test.new
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
      params.require(:test).permit(:description, :subject, :question)
    end
  
end

