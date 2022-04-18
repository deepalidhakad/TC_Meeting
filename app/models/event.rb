class Event < ApplicationRecord
    belongs_to :room

    belongs_to :user

	  validates  :purpose, :start_date, :end_date, presence: true

    validates :people, :numericality => { :greater_than_or_equal_to => 1}

    validate :hour_check

    validate :room_check
    
    validate :dates_are_available, on: :create

    private
    def dates_are_available
     room = Room.find(self.room_id)
     conditions = []
     conditions << '(:new_start_date >= :new_end_date)'
     if user.role == "Empolyee"
     conditions << '(start_date >= :new_start_date AND end_date >= :new_end_date)'
     conditions << '(start_date >= :new_start_date AND end_date <= :new_end_date)'
     conditions << '(end_date BETWEEN :new_start_date AND :new_end_date)'
     conditions << '(start_date <= :new_start_date AND end_date >= :new_end_date)'
     end
      if room.events.where(conditions.join(' OR '), new_start_date: self.start_date, new_end_date: self.end_date).exists?
       self.errors.add(:base, 'Time already taken & Please enter valid time')
       return false
      end
    end
    

    def hour_check
     @hour = (start_date.to_i - end_date.to_i)/3600
     if @hour == -1
     else
      self.errors.add(:base, 'Hours not greater then 1')
     end
    end

    def room_check
      room = Room.find(self.room_id)
       if people.to_i > room.capacity.to_i
        self.errors.add(:base, 'This room is not for many people')
      end
    end

end
