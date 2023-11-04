class DashboardsController < ApplicationController
    def index
        @last_updates = Post.last_updated_per_month
    end
end
