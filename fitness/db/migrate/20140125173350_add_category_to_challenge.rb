class AddCategoryToChallenge < ActiveRecord::Migration
  def change
  	add_column :challenges, :category, :string
  end
end
