class Geek < ApplicationRecord
    has_many :applies, dependent: :destroy

    validates :name,  presence: true, length: { maximum: 100 }
    validates :stack, presence: true, length: { maximum: 200 }
    validates :resume, inclusion: { in: [true, false] }
end
