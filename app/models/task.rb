class Task < ApplicationRecord
	validates_presence_of :title
  validate :future_completed_date

  private

  def future_completed_date
    if !completed.blank? && completed > Date.today
      self.errors.add(:completed, "cette date ne peut être dans le futur")
    end
  end
end
