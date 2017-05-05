class Book < ActiveRecord::Base
  def change
    create_table :books do |t|
      t.string :name
      t.text :introduction
      t.string :writer_name
      t.integer :price

      t.timestamps
    end
  end
end
