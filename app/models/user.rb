class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :confirmable
    devise :omniauthable, :omniauth_providers => [:facebook]

    #	has_secure_password
	validates :email, confirmation: true
	#validates :email_confirmation, presence: true
	validates :password, confirmation: true
	#validates :password_confirmation, presence: true
	
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.firstname = auth.info.name   # assuming the user model has a name
			#user.image = auth.info.image # assuming the user model has an image
			# If you are using confirmable and the provider(s) you use validate emails, 
			# uncomment the line below to skip the confirmation emails.
			user.skip_confirmation!
		end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		    user.email = data["email"] if user.email.blank?
		  end
		end
	end

	def country_name
	country = self.country
	ISO3166::Country[country]
	end	
 			  
end
