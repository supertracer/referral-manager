class Customer < ActiveRecord::Base
  has_many :codes
  has_many :customer_campaigns 
  has_many :campaigns, :through => :customer_campaigns
end
