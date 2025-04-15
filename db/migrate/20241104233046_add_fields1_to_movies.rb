class AddFields1ToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :imdb_rating, :float
    add_column :movies, :release_date, :date
  end
end
