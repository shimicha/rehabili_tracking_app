class Profile < ApplicationRecord
    belongs_to :user
    mount_uploader :icon, IconUploader
    enum gender: { man: 0, woman: 1}
end
