class Job < ApplicationRecord
  belongs_to :company
  has_many :applies, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 150 }
  validates :company_id, presence: true, numericality: { only_integer: true }
end
