class Encounter < ApplicationRecord
    # Each encounter is linked to a recruit through 
    # the recruit_id field.
    belongs_to :recruit
end
