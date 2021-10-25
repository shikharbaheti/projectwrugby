class Player < Person
  validates :dues, presence: true
  validates :status, presence: true
end
