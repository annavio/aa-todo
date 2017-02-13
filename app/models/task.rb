class Task < ApplicationRecord

	belongs_to :user

	validates_presence_of :title
  validate :future_completed_date
  validates_presence_of :user

  private

  def future_completed_date
    if !completed.blank? && completed > Date.today
      self.errors.add(:completed, "cette date ne peut être dans le futur")
    end
  end
end
