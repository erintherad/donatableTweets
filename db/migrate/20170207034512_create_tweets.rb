class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :author
      t.string :message
      t.datetime :tweeted_at
      t.bigint :tweet_id

      t.timestamps
    end
  end
end
