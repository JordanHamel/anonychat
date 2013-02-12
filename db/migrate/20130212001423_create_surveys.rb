class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :favorite_celeb
      t.integer :age
      t.integer :fav_cat_meme
      t.string :most_embarassing_moment

      t.timestamps
    end
  end
end
