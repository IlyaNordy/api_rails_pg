class Company < ApplicationRecord
    has_many :jobs, dependent: :destroy

    validates :name,     presence: true, length: { maximum: 100 }
    validates :location, presence: true, length: { maximum: 100 }
end
