class CreatePageChunks < ActiveRecord::Migration
  def change
    create_table :page_chunks do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
