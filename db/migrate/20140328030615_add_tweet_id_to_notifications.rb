class AddTweetIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :tweet_id, :integer
  end
end
