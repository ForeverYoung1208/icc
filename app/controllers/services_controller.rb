class ServicesController < ApplicationController
  before_filter :set_selected_page
  before_filter :authenticate_user!, :only=>[:edit, :update, :new, :create]
  before_filter :is_redactor, :except=>[:index, :new, :create]
  # GET /services.json
  def index

#    Uncoment following lines to allow automatic "sections" rename according to model "section" settings
#    
#    section = Section.first
#    section.rename

    @groups_services = {}
    @sections = Section.all
    @selected_section = params['selected_section']

    @sections.each do |section|
      services = Service.where(section_id: section.id)
      @groups_services[section] = services if services.length > 0
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js {}
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
        format.html { redirect_to services_url, notice: t('services.successfully_created') }
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
        format.html { redirect_to services_url, notice: t('services.successfully_updated') }
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

  private

  def set_selected_page
    @selected_page = 'services'
  end

  def is_redactor
    service = Service.find(params[:id])
    if (current_user.nil? or not(current_user.redactor?( service.section )) )
      
      redirect_to request.referer, :notice =>( t('services.not_allowed')+' '+t(service.section.name) )
    end
  end

end
