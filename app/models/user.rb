class User < ActiveRecord::Base
  has_many :courses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :display_name,
    presence: true,
    length: { maximum: 50 }
  validates :first_name,
    presence: true,
    length: { maximum: 50 }
  validates :last_name,
    presence: true,
    length: { maximum: 50 }
  validates :role_id,
    presence: true

end
