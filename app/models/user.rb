class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable #TODO add :omniauthable, :timeoutable

  validates :username,  presence: true, uniqueness: true,
                        format: { with: /[a-zA-Z0-9\-_]+/i},
                        length: { minimum: 3, maximum: 40 }

end
