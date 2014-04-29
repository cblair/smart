class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  #Disabled :validatable, as we're going to use this mostly for Facebook logins,
  # and we won't know what the email and passwords are.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable

   def self.from_omniauth(auth)
     where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.info.name
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
       user.save!
     end
   end
end
