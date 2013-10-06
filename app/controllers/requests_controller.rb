class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])
    authorize! :show, @request

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @ride = Ride.find(params[:ride_id])
   @request = Request.find(params[:id])

  end

  # POST /requests
  # POST /requests.xml
  def create
    @ride = Ride.find(params[:ride_id])
    @request = @ride.requests.build(request_params)
    @request.user_id = current_user.id
    @request.user_email = current_user.email
    @request.ride_user_email = @ride.user_email
    @request.profile_name = current_user.profile_name
    #@request.ride_starting_from = @ride.Starting_From
    #@request.ride_Going_to = @ride.Going_to
    #@request.ride_depart = @ride.depart
    #@request.ride_return = @ride.return

    respond_to do |format|
      if @request.save
        RequestMailer.request_created(@request).deliver
        RequestMailer.accept_reject(@request).deliver
        format.html { redirect_to(@ride, :notice => 'Request was successfully created.') }
        format.xml  { render :xml => @ride, :status => :created, :location => @ride }
      else
          format.html { render :template => "rides/show" }
          format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    respond_to do |format|
      if @request.update_attributes(:accept => "t")
        RequestMailer.accepted(@request).deliver
        format.html { redirect_to(@ride, :notice => 'Request was successfully accepted.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @ride = Ride.find(params[:ride_id]) 
    @request.destroy
    RequestMailer.rejected(@request).deliver
    respond_to do |format|
      format.html { redirect_to(@ride, :notice => 'Request was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:id, :ride_id, :notes, :phone, :accept)
    end
end
