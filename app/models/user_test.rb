class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  has_many :user_test_answers
  has_many :answers, through: :user_test_answers

  has_many :test_questions
  has_many :questions, through: :test_questions

  accepts_nested_attributes_for :user_test_answers

  #método calcular a nota
  def self.calc_grade(user_id, test_id)
    user_test = UserTest.where(user_id: user_id, test_id: test_id)[0] #pega o user 
    answers = user_test.answers

    correct_answers = 0
    all_questions_weight = 0 

    answers.each do |answer|
      if answer.correct?
        correct_answers += answer.question.weight
        all_questions_weight += answer.question.weight
      else 
        all_questions_weight += answer.question.weight
      end
    end
      return grade = (correct_answers / all_questions_weight.to_f) * 10
  end
  
  def self.search_test_answers(user_id, test_id)
    return UserTest.where(user_id: user_id, test_id: test_id)[0].answers.to_a
  end

end


