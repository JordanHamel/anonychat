class Survey < ActiveRecord::Base
  attr_accessible :age, :fav_cat_meme, :favorite_celeb, :most_embarassing_moment

  validates :age, presence: true
  validates :fav_cat_meme, presence: true
  validates :favorite_celeb, presence: true
  validates :most_embarassing_moment, presence: true

  def self.most_pop_cat
    self
      .select("fav_cat_meme, COUNT(*) AS cat_popularity")
      .group(:fav_cat_meme)
      .order("cat_popularity DESC")
      .first
  end

  def self.most_pop_celeb
    self
      .select("favorite_celeb, COUNT(*) as celeb_popularity")
      .group(:favorite_celeb)
      .order("celeb_popularity DESC")
      .first
      .favorite_celeb
  end

  def self.random_moment
    self
      .select("most_embarassing_moment")
      .order("RANDOM()")
      .first
  end
end
