class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :notes, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :username, uniqueness: {message: "- This username has already been taken", case_sensitive: false }

  def admin?
    role == 'admin'
  end
  
end
