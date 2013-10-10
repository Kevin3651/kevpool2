class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # 
  # 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable,          
         :lockable, :timeoutable, :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@grinnell.edu\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
has_many :rides
has_many :requests
has_many :seats
has_many :profiles
has_and_belongs_to_many :roles

def role?(role)
   return !!self.roles.find_by_name(role.to_s)
 end

 before_create :setup_role
private
def setup_role
  if self.role_ids.empty?
    self.role_ids = [2]
  end
end
end
