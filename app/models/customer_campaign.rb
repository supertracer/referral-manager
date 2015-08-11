class CustomerCampaign < ActiveRecord::Base
  belongs_to :customer
  belongs_to :campaign
end
