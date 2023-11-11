class Post < ApplicationRecord
    belongs_to :training_menu
    belongs_to :user

    def self.last_updated_per_month
        group_by_month(:updated_at, last: 12).maximum(:updated_at)
    end
end
