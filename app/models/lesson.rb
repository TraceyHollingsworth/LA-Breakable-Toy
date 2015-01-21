class Lesson < ActiveRecord::Base
  belongs_to :course
  validates :date, presence: true
  validates :objective, presence: true
end
