class User < ApplicationRecord

	has_many :events, dependent: :destroy

	has_secure_password

	has_one_attached :image

	validates :username, :password, presence: true,  on: :create
	validates :username, uniqueness: true,  on: :create

    def to_s
    	"#{username}"
    end
    
end
