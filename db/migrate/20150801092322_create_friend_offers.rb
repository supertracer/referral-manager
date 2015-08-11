class CreateFriendOffers < ActiveRecord::Migration
  def change
    create_table :friend_offers do |t|
      
      t.column "friend_offer_type", :string
      t.column "friend_start_date", :datetime
      t.column "friend_end_date", :datetime
      t.column "friend_min_purchase", :integer

      t.timestamps null: false
    end
  end
end
