class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      
      t.references :customer
      t.string "redemption_code", :limit => 15
      t.datetime "redeemed_on", :default => nil

      t.timestamps null: false
    end
  end
end
