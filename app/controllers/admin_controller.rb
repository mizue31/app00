class AdminController < ApplicationController

  before_filter :authenticate_user!

  def index
    @services = Service.all
    @components = Component.all
    @servers = Server.all
    @softwares = Software.all
    @all_table = Service.find(:all, :joins => {:service_components => [:component => {:component_servers=>[:server]}]})

    respond_to do |format|
      format.html
      format.js { render :layout=> false}
      format.csv {
        data = ""
        @all_table.each do |service|
          line = []
          line.push service[:id]
          line.push service[:name]
          service.service_components.each do |sc|
            line.push sc[:service_id]
            line.push sc[:component_id]
            service.components.each do |compo|
              line.push compo.name
              compo.component_servers.each do |cs|
                line.push cs[:component_id]
                line.push cs[:server_id]
                compo.servers.each do |server|
                  line.push server.host_name
                end
              end
            end
          end
          data = data + line.join(',') + "\n"
        end
        send_data data, :type=>"text/csv; charset=shift_jis", :filename=>"all_table.csv"
      }
    end
  end

  def show
  end

  #layout :determined_by_request

  protected

  def determined_by_requests
    if request.xhr?
      return false
    else
      'application'
    end
  end

end
