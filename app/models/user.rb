class User < ApplicationRecord
  authenticates_with_sorcery!
  before_create :generate_identifier

  has_one :profile, dependent: :destroy
  has_many :exercise_plans, dependent: :destroy
  has_many :exercise_progresses, dependent: :destroy
  has_many :dashboards, dependent: :destroy

  enum role: { general: 0, admin: 1 }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :identifier, uniqueness: true

  def generate_identifier
    # 一意の識別子を生成（ここでは簡単のためSecureRandomを使用）
    self.identifier = SecureRandom.hex(10)
  end

end
