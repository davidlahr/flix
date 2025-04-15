class AddField2ToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :description, :string
  end
end
