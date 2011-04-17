class InvestorSessionsController < ApplicationController

  def new
    @investor_session = InvestorSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @investor_session }
    end
  end
  
  def create
    @investor_session = InvestorSession.new(params[:investor_session])
    
    @investor = Investor.find_by_username(@investor_session.username)
    
    if @investor
      if @investor.created_at <= 48.hours.ago
        flash[:notice] = "This Investor Login has Expired"
        redirect_to root_url
      else        
        if @investor_session.save
          flash[:notice] = 'Login Successfull'
          redirect_to investor_path
        else
          flash[:notice] = "Invalid login, please try gain"
          render :action => "new"
        end
      end
    else
      flash[:notice] = "Invalid login, please try gain"
      render :action => "new"
    end
  end
  
  def destroy
    @investor_session = InvestorSession.find(current_investor)
    @investor_session.destroy
    flash[:notice] = "Thank you for checking out Moonwalk Cardio"
    redirect_to root_path
  end
  
end
