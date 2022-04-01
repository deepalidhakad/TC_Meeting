class Event < ApplicationRecord

    belongs_to :user

	  validates  :purpose, :start_date, :end_date, presence: true

    validate :dates_are_available, on: :create

    validates :people, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 20 }

    validate :hour_check, on: :create

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

  def hour_check
     @hour = (start_date.to_i - end_date.to_i)/3600
     if @hour == -1
     else
      self.errors.add(:base, 'Hours not greater then 1')
    end
  end

end
