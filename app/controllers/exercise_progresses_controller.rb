class ExerciseProgressesController < ApplicationController
def index
end

def new
    @exercise_plans = ExercisePlan.all
    @exercise_progresse = ExerciseProgresse.new
    @exercise_progresse.date = Date.today
end

end
