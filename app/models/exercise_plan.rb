class ExercisePlan < ApplicationRecord
    has_many :posts
    belongs_to :therapist_user

    validates :training_menu, presence: true
    validates :description, presence: true
end
