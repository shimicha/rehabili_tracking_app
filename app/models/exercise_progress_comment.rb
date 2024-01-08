class ExerciseProgressComment < ApplicationRecord
    belongs_to :user 
    belongs_to :exercise_progress
end