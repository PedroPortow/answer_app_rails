class TestAnswer < ApplicationRecord
  #Mudar nome desse Model 

  belongs_to :user
  belongs_to :test
  belongs_to :question
  belongs_to :answer
end
