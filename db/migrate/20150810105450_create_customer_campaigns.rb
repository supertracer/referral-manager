class CreateCustomerCampaigns < ActiveRecord::Migration
  def change
    create_table :customer_campaigns do |t|
      
      t.references :customer
      t.references :campaign
      t.integer "no_of_referrals", :default => 0

      t.timestamps null: false
    end
  end
end
