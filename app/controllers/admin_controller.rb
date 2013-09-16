class AdminController < ApplicationController

  def index
    @services = Service.all
    @components = Component.all
    @servers = Server.all
    @softwares = Software.all
    respond_to do |format|
      format.html
      format.js {render :layout=> false}
    end
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
