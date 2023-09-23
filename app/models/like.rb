class Like < ApplicationRecord
  belongs_to :krk
  belongs_to :user
  validates_uniqueness_of :krk_id, scope: :user_id
end
