class Outfit < ApplicationRecord
  has_many :clothings
  belongs_to :user
  has_many :comments, :dependent => :destroy
end
