class Relationship < ApplicationRecord
    belongs_to :patient, class_name: "User"
    belongs_to :therapist, class_name: "User"
end
