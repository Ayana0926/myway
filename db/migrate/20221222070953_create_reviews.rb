class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end

class AddImageReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :image, :string
  end
end