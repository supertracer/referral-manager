class CustomersController < ApplicationController
   
  layout "client"
  
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def new
  end
  
  def create
    @customer = Customer.new(customer_params)
    @temp = Customer.find_by_referral_code(@customer.referral_code)
    Rails.logger.info("$$$$444444444444444444444444444$$$$$$$$$******************2$$$$$$$$$$$$$$$$$#{@temp.inspect}")
    if @temp.nil?
      @customer.referral_code = @customer.first_name.split(//).first(3).join + @customer.last_name.split(//).first(3).join
      if @customer.save
        @caid = Campaign.find_by_campaign_status(1) 
        Rails.logger.info("**************")
        Rails.logger.info(@customer.inspect)
        Rails.logger.info("**************")
        @custcamp = CustomerCampaign.create(:customer => @customer, :campaign => @caid, :no_of_referrals => 0)
        redirect_to(:action => 'index')
      else
        render('new')
      end
    else
         @customer.referred_by = @temp.first_name + @temp.last_name
         @customer.referral_code = @customer.first_name.split(//).first(3).join + @customer.last_name.split(//).first(3).join
         if @customer.save
              @caid = Campaign.find_by_campaign_status(1) 
              # Rails.logger.info("$$$$$$$$$$$$$******************2$$$$$$$$$$$$$$$$$#{@caid.inspect}")
              @custcamp = CustomerCampaign.create(:customer => @customer, :campaign => @caid, :no_of_referrals => 0)
              c = @temp.no_of_referrals + 1
              @temp.update_attributes(:no_of_referrals => c)
              @cctemp = CustomerCampaign.where(:customer_id => @temp.id, :campaign_id => @caid.id).first
              Rails.logger.info("$$$$$$$$$$$$$$$$$$$$$$$$$$#{@cctemp.inspect}")
              k = @cctemp.no_of_referrals + 1
              @cctemp.update_attributes(:no_of_referrals => k)
              
                if @temp.no_of_referrals.even?
                   # /*generate new row for ccustomer.id in code table */
                    @code = Code.new(:redemption_code => "aaaa"  ,:redeemed_on => nil)
                    if @code.save
                      @temp.codes << @code  
                    end
                    
                    
                else
                end
         redirect_to(:action => 'index')
         else
          render('new')
         end
    end
  end
  
  def edit
  end
  
  def new_code
    code.new()
  end
  
  
  
  private
  def customer_params
     params.require(:customer).permit(:first_name, :last_name, :email, :mobile, :referral_code)
  end
end
