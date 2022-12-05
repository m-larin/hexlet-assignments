class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :completed, inclusion: [true, false]

  after_initialize :defaults

  def defaults
    unless persisted?
      self.status ||= :new
      self.completed ||= false
    end
  end
end
