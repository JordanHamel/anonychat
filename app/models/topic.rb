class Topic < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :posts

  validates :title, presence: true, length: { maximum: 15 }
  validates :description, length: { maximum: 1245 }
end
