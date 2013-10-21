class Request2sController < ApplicationController
  # GET /request2s
  # GET /request2s.xml
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @request2s = Request2.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @request2s }
    end
  end

  # GET /request2s/1
  # GET /request2s/1.xml
  def show
    @request2 = Request2.find(params[:id])
    authorize! :show, @request2

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request2 }
    end
  end

  # GET /request2s/new
  # GET /request2s/new.xml
  def new
    @request2 = Request2.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request2 }
    end
  end

  # GET /request2s/1/edit
  def edit
    @fast = Fast.find(params[:fast_id])
   @request2 = Request2.find(params[:id])

  end

  # POST /request2s
  # POST /request2s.xml
  def create
    @fast = Fast.find(params[:fast_id])
    @request2 = @fast.request2s.build(request2_params)
    @request2.user_id = current_user.id
    @request2.user_email = current_user.email
    @request2.fast_user_email = @fast.user_email
    @request2.profile_name = current_user.profile_name
    #@request2.fast_starting_from = @fast.Starting_From
    #@request2.fast_Going_to = @fast.Going_to
    #@request2.fast_depart = @fast.depart
    #@request2.fast_return = @fast.return

    respond_to do |format|
      if @request2.save
        Request2Mailer.request2_created(@request2).deliver
        Request2Mailer.accept_reject(@request2).deliver
        format.html { redirect_to(@fast, :notice => 'Request2 was successfully created.') }
        format.xml  { render :xml => @fast, :status => :created, :location => @fast }
      else
          format.html { render :template => "fasts/show" }
          format.xml  { render :xml => @request2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /request2s/1
  # PUT /request2s/1.xml
  def update
    @request2 = Request2.find(params[:id])
    @fast = Fast.find(params[:fast_id])
    respond_to do |format|
      if @request2.update_attributes(:accept => "t")
        Request2Mailer.accepted(@request2).deliver
        format.html { redirect_to(@fast, :notice => 'Request2 was successfully accepted.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request2.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  # DELETE /request2s/1
  # DELETE /request2s/1.xml
  def destroy
    @request2 = Request2.find(params[:id])
    @fast = Fast.find(params[:fast_id]) 
    @request2.destroy
    Request2Mailer.rejected(@request2).deliver
    respond_to do |format|
      format.html { redirect_to(@fast, :notice => 'Request2 was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request2
      @request2 = Request2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request2_params
      params.require(:request2).permit(:id, :fast_id, :notes, :phone, :accept)
    end
end
