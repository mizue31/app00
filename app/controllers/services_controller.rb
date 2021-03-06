class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @services   = Service.all
    
    # get all nested tables
    @all_table = Service.find(:all, :joins => {:service_components => [:component => {:component_servers=>[:server]}]})
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
      #added for csv
      format.csv {
        send_data Service.to_csv(@services), type: 'text/csv; charset=shift_jis', filename: "services.csv"
       }
#      format.csv { send_data @services.to_csv }
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

    # added for nested data
    @service.service_components.build

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
        format.json { head :no_content }
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
      format.json { head :no_content }
    end
  end

  #
  # Upolad and import
  #
  def import
    Service.import(params[:file])
    redirect_to services_path, notice: "Service imported"
  end

end

