class SearchController < ApplicationController

  before_filter :authenticate_user!

  # added
  # Index page for Search
  def index
    @conditions = OpenStruct.new(params[:conditions])
    @services   = Service.all
    @components = Component.all
    @servers    = Server.all

    respond_to do |format|
      format.html
#      format.json { render json: @server }
    end
  end

  # added
  # SEARCH execute action
  def exec_search

    logger.debug("Called Search action")

    if params[:conditions][:sc] != "" then
      key = "services"
      @search = Service.find_by_id(params[:conditions][:sc].to_i)
    elsif params[:conditions][:sv] then
      key = "servers"
      @search = Server.find_by_id(params[:conditions][:sv].to_i)
    end
    logger.debug("KEY:" + key)
    logger.debug("ID:" + params[:conditions][:sv])

    render :template => "search/search_by_"+key, :locals => {:key=>key, :search=>@search}

#    respond_to do |format|
#      format.html {@search}
#    end
  end

end
