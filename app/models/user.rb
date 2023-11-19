class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one :profile, dependent: :destroy

  has_many :therapists, through: :relationships, source: :therapist
  has_many :patients, through: :reverse_of_relationships, source: :patient

  enum role: { general: 0, admin: 1 }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def assigned_therapist?(therapist)
    therapists.include?(therapist)
  end
end
