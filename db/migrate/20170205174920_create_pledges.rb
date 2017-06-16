class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.integer :dollars_per_tweet
      t.integer :max_per_month
      t.integer :month_to_date
      t.integer :lifetime_total

      t.timestamps
    end
  end
end
