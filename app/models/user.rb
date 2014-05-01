class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable #TODO add :omniauthable, :timeoutable

  validates :username, presence: true, uniqueness: true

end
