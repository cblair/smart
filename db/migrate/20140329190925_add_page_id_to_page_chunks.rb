class AddPageIdToPageChunks < ActiveRecord::Migration
  def change
    add_column :page_chunks, :page_id, :integer
  end
end
