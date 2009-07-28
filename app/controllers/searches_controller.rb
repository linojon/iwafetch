class SearchesController < ApplicationController  
  # GET /searches
  # GET /searches.xml
  def index
    @searches = Search.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.xml
  def show
    @search = Search.find(params[:id])
#debugger
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.xml
  def new
    @search = Search.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.xml
  def create
    #debugger
    @search = Search.new(params[:search])
    
    respond_to do |format|
      if @search.save && @search.fetch
        flash[:notice] = 'Search was successfully created.'
        format.html { redirect_to(@search) } # BUG: why doesnt this go into the show action?
        format.xml  { render :xml => @search, :status => :created, :location => @search }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.xml
  def update
    @search = Search.find(params[:id])
    # TODO: only allow change to 'done' attribute
    #debugger
    
    respond_to do |format|
      if @search.update_attributes(params[:search])
        #debugger
        flash[:notice] = 'Search was successfully updated.'
        format.html { redirect_to(searches_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.xml
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to(searches_url) }
      format.xml  { head :ok }
    end
  end
  
  def delete_checked
    #debugger
    params["searches"].each do |id|
      Search.destroy(id)
    end
    flash[:notice] = "Deleted #{params['searches'].size} items"
    redirect_to(searches_url)
  end
end
