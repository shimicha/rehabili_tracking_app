class ExerciseProgress < ApplicationRecord
    belongs_to :user 
    has_many :exercise_progress_comments, dependent: :destroy

    validates :date, presence: true
    validates :progresse_keep, presence: true
end
