class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @statuses = Status.all
    @event = Event.joins('INNER JOIN services ON events.service_id = services.id INNER JOIN statuses ON events.status_id = statuses.id').order("created_at DESC")
    @status = Status.joins('INNER JOIN events ON statuses.id = events.status_id INNER JOIN services ON events.service_id = services.id')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])
    @service.events.all
    @event = Event.joins('INNER JOIN services ON events.service_id = services.id').where("events.service_id= #{params[:id]}").order("created_at DESC")
    @status = Status.joins('INNER JOIN events ON statuses.id = events.status_id INNER JOIN services ON events.service_id = services.id').where("events.service_id= #{params[:id]}" )
    @statuses = Status.all
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
    @count = Event.where(:service_id  => params[:id]).count

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @count = Event.where(:service_id  => params[:id]).count
    @service = Service.find(params[:id])
    @event = @service.events.build
    @statuses = Status.all
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])
    #@events = @service.events.build

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
    #@event = @service.events.create(params[:id])
    #@company = Company.find_or_create_by_name(params[:company][:name])
    #@person  = @company.people.create(params[:person])

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
