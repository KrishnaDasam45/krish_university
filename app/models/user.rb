class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

    def randmonpwd
	    unless self.password
	      self.password = self.email#1_000_000 + Random.rand(10_000_000 - 1_000_000)
	      self.password_confirmation = self.password
	    end  
 		end
end
