class Profile < ApplicationRecord
    belongs_to :user
    mount_uploader :icon, IconUploader
    enum gender: { man: 0, woman: 1}

    validates :age, presence: true
    validates :gender, presence: true
    validates :icon, presence: true
    validates :history_of_present_illness, presence: true
    validates :contraindications, presence: true
    validates :medical_history, presence: true
    validates :surgery_history, presence: true
end
