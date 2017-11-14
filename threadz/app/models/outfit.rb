class Outfit < ApplicationRecord
  has_many :clothings
  has_many :comments, :dependent => :destroy
end
