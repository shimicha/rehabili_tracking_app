class DashboardsController < ApplicationController
    def index
        @monthly_data = (1..12).map do |month|
          {
            month: Date::MONTHNAMES[month],
            details: "デフォルトの詳細"
          }
        end
      end
end
