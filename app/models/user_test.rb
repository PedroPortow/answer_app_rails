class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  has_many :test_answers
  has_many :answers, through: :test_answers
  has_many :test_questions
  has_many :questions, through: :test_questions

  # accepts_nested_attributes_for :user_test_answer
  

  def
  #  correct_answers = answers.select(&:correct)
  end

  #método calcular a nota
  def grade
   # test_ansers = UserTestAnswer.where(user: user, test: test)

  end

  
end
  # def self.set_test(current_user, test_id, grade)
  #   newUserTest = UserTest.new
  #   newUserTest.user_id = current_user
  #   newUserTest.test_id = test_id
  #   newUserTest.grade = grade
  #   newUserTest.save!
  # end

  # def self.get_grades(id)
  #   grades = UserTest.select(:test_id, :grade).where(:user_id => id).to_a

  #   test_grade = {}
  #   grades.each do |g|
  #     test_grade[g.test_id] = g.grade
  #   end
  #   return test_grade
  # end

  # def self.get_test_submission_timestamps(id)
  #   times = UserTest.select(:test_id, :created_at).where(:user_id => id).to_a

  #   test_time = {}
  #   times.each do |t|
  #     test_time[t.test_id] = t.created_at
  #   end
  #   return test_time
  end