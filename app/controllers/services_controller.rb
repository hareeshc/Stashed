class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @statuses = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])

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
class ThingsController < ApplicationController
  before_filter :get_thing, :only => [ :edit, :show, :update, :destroy ]

  def get_thing
    begin
      @thing = Thing.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "public/404.html", status: 404
    end
  end

  # GET /things
  def index
    @things = Thing.all
  end

  # GET /things/1
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  def create
    @thing = Thing.new(params[:thing])
    if @thing.save
      redirect_to @thing, notice: 'Thing was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /things/1
  def update
    if @thing.update_attributes(params[:thing])
      redirect_to @thing, notice: 'Thing was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /things/1
  def destroy
    @thing.destroy
    redirect_to things_url
  end
end

