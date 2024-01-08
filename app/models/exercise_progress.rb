class ExerciseProgress < ApplicationRecord
    belongs_to :user 
    has_many :exercise_progress_comments
end
