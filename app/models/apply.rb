class Apply < ApplicationRecord
  belongs_to :job
  belongs_to :geek

  validates :job_id,  presence: true, numericality: { only_integer: true }
  validates :geek_id, presence: true, numericality: { only_integer: true }
  validates :read,    inclusion: { in: [true, false] }
  validates :invited, inclusion: { in: [true, false] }

  validates_associated :job, :geek
end
