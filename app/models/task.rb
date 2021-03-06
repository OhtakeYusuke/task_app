class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 30}
  # 独自バリデーション
  validate :validate_name_not_including_comma
  # モデルの関連づけ
  belongs_to :user

  private
  def validate_name_not_including_comma
    errors.add(:name, "にカンマを含めません") if name&.include?(",")
  end
  
end
