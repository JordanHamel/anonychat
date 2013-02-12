class Topic < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :posts

  validates :title, presence: true
  validates :description, length: { maximum: 1245 }
end
