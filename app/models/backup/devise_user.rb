class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#	has_secure_password
	validates :email, confirmation: true
	validates :email_confirmation, presence: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	def country_name
	country = self.country
	ISO3166::Country[country]
	end

end
