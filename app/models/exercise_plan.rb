class ExercisePlan < ApplicationRecord
    mount_uploaders :images, ImageUploader

    validates :training_menu, presence: true
    validates :description, presence: true
    validates :images, presence: true
    validates :movie_url, presence: true, format: { with: /\Ahttps?:\/\/.*\z/, message: "有効なURLを入力してください" }

end
