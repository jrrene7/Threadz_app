class Clothing < ApplicationRecord
  belongs_to :outfit
  has_many :comments, :dependent => :destroy
end
