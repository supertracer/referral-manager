class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      
      # t.references :advocate_offer
      # t.references :friend_offer
      t.column "campaign_name", :string
      t.column "campaign_description", :string
      t.column "campaign_start_date", :datetime
      t.column "campaign_end_date", :datetime
      t.column "advocate_offer_type", :string
      t.column "advocate_min_purchase", :string
      t.column "advocate_review_period", :string
      t.column "referral_code_limit", :string
      t.column "friend_offer_type", :string
      t.column "friend_min_purchase", :string
      t.column "campaign_status", :boolean, :default => false
      
      t.timestamps null: false
    end
  end
end
