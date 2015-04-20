class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items

  before_create :set_auth_token

  protected
  	def set_auth_token
  		return if auth_token.present?
  		self.auth_token = generate_auth_token
  	end
  	def generate_auth_token
  		SecureRandom.uuid.gsub(/\-/,'')
  	end
end
