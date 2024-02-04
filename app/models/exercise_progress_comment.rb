class ExerciseProgressComment < ApplicationRecord
    belongs_to :exercise_progress

    validates :comment, presence: true
end