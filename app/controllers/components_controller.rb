class ComponentsController < ApplicationController
  # GET /components
  # GET /components.json
  def index
    @components = Component.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @components }
      format.csv {send_data Component.to_csv(@components), type: 'text/csv; charset=shift_jis', filename: "components.csv"}
    end
  end

  # GET /components/1
  # GET /components/1.json
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/new
  # GET /components/new.json
  def new
    @component = Component.new

    # 3.times {@component.component_servers.build}
    @component.component_servers.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])

    @component_servers = @component.component_servers

  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        format.html { redirect_to @component, notice: 'Component was successfully created.' }
        format.json { render json: @component, status: :created, location: @component }
      else
        format.html { render action: "new" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.json
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        format.html { redirect_to @component, notice: 'Component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to components_url }
      format.json { head :no_content }
    end
  end
end
