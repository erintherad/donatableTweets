class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :twitter_handle
      t.string :location

      t.timestamps
    end
  end
end
