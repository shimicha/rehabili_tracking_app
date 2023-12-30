class DashboardsController < ApplicationController
    def index
      @monthly_data = (1..12).map do |month|
        last_day_of_month = Date.new(Date.today.year, month, -1)
        latest_progress = ExerciseProgresse.where('date <= ?', last_day_of_month)
                                          .order(updated_at: :desc).first
        {
          month: Date::MONTHNAMES[month],
          latest_progress: latest_progress
        }
      end
    end
end
