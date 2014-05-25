class ChangeTweetIdInNotifications < ActiveRecord::Migration
  def change
   change_column :notifications, :tweet_id, :string
  end
end
