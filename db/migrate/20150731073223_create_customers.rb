class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      
      t.string "first_name", :limit =>25
      t.string "last_name", :limit => 50
      t.string "email", :default => "",:null => false
      t.string "mobile", :limit => 10
      t.string "referred_by", :limit => 25, :default =>nil
      t.string "referral_code", :limit => 15
      t.integer "no_of_referrals", :default => 0

      t.timestamps null: false
    end
  end
end
