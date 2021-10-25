class Player < Person
  validates :dues, presence: true
  validates :status, presence: true

  has_many :attendance_types
  has_many :notes
end
