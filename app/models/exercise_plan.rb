class ExercisePlan < ApplicationRecord
    mount_uploaders :images, ImageUploader
    belongs_to :user

    validates :training_menu, presence: true
    validates :description, presence: true
    validates :movie_url, format: { with: /\Ahttps?:\/\/.*\z/, message: "有効なURLを入力してください" }

end
