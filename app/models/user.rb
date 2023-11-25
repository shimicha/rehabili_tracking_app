class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one :profile, dependent: :destroy

  has_many :patient, class_name: "Relationship", foreign_key: "patient_id", dependent: :destroy
  has_many :therapist, class_name: "Relationship", foreign_key: "therapist_id", dependent: :destroy
  has_many :patients, through: :therapist, source: :patient
  has_many :therapists, through: :patient, source: :therapist

  enum role: { general: 0, admin: 1 }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def handle(user_id)
    therapist.create(patient_id: user_id)
  end

  def unhandle(user_id)
    therapist.find_by(patient_id: user_id).destroy
  end

  def handling?(user)
    therapists.include?(user)
  end
end
