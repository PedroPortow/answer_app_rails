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
  

    answers = UserTestAnswer.where(user_test_id: test_id)


   
  end

  def self.get_test_submission_timestamps(id)
    times = UserTest.select(:test_id, :created_at).where(:user_id => id).to_a

    test_time = {}
    times.each do |t|
      test_time[t.test_id] = t.created_at
    end
    return test_time
  end

end


