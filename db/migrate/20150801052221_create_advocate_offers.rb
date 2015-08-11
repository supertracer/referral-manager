class CreateAdvocateOffers < ActiveRecord::Migration
  def change
    create_table :advocate_offers do |t|
      
      t.column "advocate_offer_type", :string
      t.column "advocate_start_date", :datetime
      t.column "advocate_end_date", :datetime
      t.column "advocate_min_purchase", :string
      t.column "advocate_review_period", :string
      t.column "referral_code_limit", :string
      

      t.timestamps null: false
    end
  end
end
