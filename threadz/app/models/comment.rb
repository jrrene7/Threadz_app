class Comment < ApplicationRecord
  # belongs_to :user
  # belongs_to :outfit
  belongs_to :clothing
  # validates :user_id, presence: true
  # validates :outfit_id, presence: true
  # validates :clothing_id, presence: true
  # validates :content, presence: true
end
