class DashboardsController < ApplicationController
  def index
    @monthly_data = (1..12).map do |month|
      latest_progress = ExerciseProgress.where(user_id: current_user.id)
                                        .select { |ep| ep.date.month == month }
                                        .max_by(&:date)

      {
        month: Date::MONTHNAMES[month],
        latest_progress_date: latest_progress ? latest_progress.date : nil
      }
    end
  end
end
