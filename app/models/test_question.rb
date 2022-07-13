class TestQuestion < ApplicationRecord
  belongs_to :test
  belongs_to :questions
  has_many :test_questions
end
