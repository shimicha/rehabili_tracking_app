class ExercisePlan < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    validates :training_menu, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :movie_url, presence: true, format: { with: /\Ahttps?:\/\/.*\z/, message: "有効なURLを入力してください" }
  

    validates :training_menu, presence: true
    validates :description, presence: true
end
