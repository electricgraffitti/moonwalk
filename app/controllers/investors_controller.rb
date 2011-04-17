class InvestorsController < ApplicationController
  
  before_filter :require_admin, :except => [:index]
  before_filter :require_investor, :only => :index
  
  # GET /investors
  # GET /investors.xml
  def index
    @investors = Investor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @investors }
    end
  end

  # GET /investors/1
  # GET /investors/1.xml
  def show
    @investor = Investor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @investor }
    end
  end

  # GET /investors/new
  # GET /investors/new.xml
  def new
    @investor = Investor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @investor }
    end
  end

  # GET /investors/1/edit
  def edit
    @investor = Investor.find(params[:id])
  end

  # POST /investors
  # POST /investors.xml
  def create
    @investor = Investor.new(params[:investor])

    respond_to do |format|
      if @investor.save
        @investor_session = InvestorSession.find(current_investor)
        @investor_session.destroy
        flash[:notice] = 'Investor was successfully created.'
        format.html { redirect_to admins_path }
        format.xml  { render :xml => @investor, :status => :created, :location => @investor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @investor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /investors/1
  # PUT /investors/1.xml
  def update
    @investor = Investor.find(params[:id])

    respond_to do |format|
      if @investor.update_attributes(params[:investor])
        flash[:notice] = 'Investor was successfully updated.'
        format.html { redirect_to(@investor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @investor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /investors/1
  # DELETE /investors/1.xml
  def destroy
    @investor = Investor.find(params[:id])
    @investor.destroy

    respond_to do |format|
      format.html { redirect_to(investors_url) }
      format.xml  { head :ok }
    end
  end
end
