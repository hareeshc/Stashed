class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @statuses = Status.all
    #@events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])
    #@service = Service.find_by_name(CGI::unescape(parsams[:service_name]))
    #@events = @service.get_all_statuses

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new
    @service.events.build
    @statuses = Status.all

    #@event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end


  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    #@service.events.build
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])

    #@event = Event.new(params[:event])

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @event }
    #end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    #@event = Event.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :ok }
    end
  end
end
