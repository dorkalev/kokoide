class CreatePhiles < ActiveRecord::Migration
  def change
    create_table :philes do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
