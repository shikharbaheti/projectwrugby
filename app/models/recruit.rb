class Recruit < Person
    validates :contact_type, presence: true
    validates :interest_level, presence: true
    validates :times_contacted, presence: true
    validates :date_contacted, presence: true
end
