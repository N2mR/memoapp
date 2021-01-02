class Memo < ApplicationRecord
  belongs_to :user

  validates :subject, length: { maximum: 20 }
  validates :memo, presence: true, length: { maximum: 3000 }
  validates :user_id, presence: true

end
