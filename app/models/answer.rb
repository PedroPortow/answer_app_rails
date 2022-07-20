class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_tests
  has_many :tests, through: :test_questions
  has_many :user_test_answers
  has_many :user_tests, through: :user_test_answers
end
