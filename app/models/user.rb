class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable #, :omniauthable, :timeoutable
  validates :username, presence: true, uniqueness: true

end
