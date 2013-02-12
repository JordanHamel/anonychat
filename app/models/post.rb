class Post < ActiveRecord::Base
  attr_accessible :body, :title, :topic_id

  belongs_to :topic
  has_many :comments

  validates :body, presence: true, length: { within: 10..2000 },
            uniqueness: true
  validates :title, presence: true
  validates :topic_id, presence: true
end
