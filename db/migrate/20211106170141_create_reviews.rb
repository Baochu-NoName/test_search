class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.decimal :rating, precision: 2, scale: 1
      t.text :comment

      t.timestamps
    end
  end
end
