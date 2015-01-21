class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lessons
  validates :title, presence: true
end
