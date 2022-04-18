class Room < ApplicationRecord
	has_many :events, dependent: :destroy
	
	validates  :room_name, presence: true

    validates :capacity, :numericality => { :greater_than_or_equal_to => 1}

    def room
    	"#{room_name}"
    end
end
