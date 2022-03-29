class Event < ApplicationRecord

    belongs_to :user

	validates  :purpose, :start_date, :end_date, :people, presence: true

    validate :dates_are_available, on: :create

    # validate :date_are_valid

    private

    # def dates_are_available
    #     user = User.find(self.user_id)
    #     conditions = []
    #     conditions << '(start_date >= :new_start_date AND end_date >= :new_end_date)'
    #     conditions << '(start_date >= :new_start_date AND end_date <= :new_end_date)'
    #     conditions << '(end_date BETWEEN :new_start_date AND :new_end_date)'
    #     conditions << '(start_date <= :new_start_date AND end_date >= :new_end_date)'
    #     if user.events.where(conditions.join(' OR '), new_start_date: self.start_date, new_end_date: self.end_date).exists?
    #         self.errors.add(:base, 'Date already taken')
    #         return false
    #     end
    # end


  def dates_are_available
    conditions = []
    conditions << '(start_date BETWEEN :new_start_date AND :new_end_date)' # the new range contains an already existing start_date
    conditions << '(end_date BETWEEN :new_start_date AND :new_end_date)' # the new range contains an already existing end_date
    conditions << '(start_date <= :new_start_date AND end_date >= :new_end_date)' # the new range contains an already existing range start_date..end_date
    conditions << '(:new_start_date >= :new_end_date)'
    if Event.where(conditions.join(' OR '), new_start_date: self.start_date, new_end_date: self.end_date).exists?
      self.errors.add(:base, 'Time Already Taken')
    end
  end

    # def date_are_valid
  		# if self.start_date <= self.end_date 
    #  	else
  	 #       errors.add(:end_date, "And End Time Not Valid")
    # 	end
    #  end

end
