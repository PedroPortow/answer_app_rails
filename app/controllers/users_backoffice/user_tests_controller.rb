class UsersBackoffice::UserTestsController < UsersBackofficeController
  before_action :set_test, only: [:new, :results, :show]

  #current_user -> já pega o id do user de agora, não precisa sempre passar por param
  # form renderizado pelo new, faz uma requisiçao post pro create
  # tem que permitir os params do form

  def new
    @user_test = current_user.user_tests.new #já pega o user_id
    @user_test.user_test_answers.new

   end

  def create #save aqui
    @user_test = current_user.user_tests.new(params_test)
    
    if  @user_test.save!
      #@user_test.grade = UserTest.calc_grade(current_user.id, params[:test_id])
      @user_test.save
      redirect_to "/users_backoffice/tests/#{params[:test_id]}/user_tests/results"
    else
      render :new
    end
    
   end

  def results
    #pagina de resultados após realização da prova
  end

  def show
    #mostrar avaliação relaziada
    # @user_test = UserTest.find(params[:id])
    @user_test = current_user.user_tests.find(params[:test_id])
  end


  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  # def set_current_user

  # end

  def params_test
    params.permit(:test_id, answer_ids: [])
  end

 

end
