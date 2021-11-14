class Player < Person
  validates :dues, presence: true
  validates :status, presence: true
  #belongs_to :person, foreign_key: :parent_id
  has_many :attendancerecords
#  accepts_nested_attributes_for :attendancerecords
  #validates :attendancerecord_id, presence: true


end
