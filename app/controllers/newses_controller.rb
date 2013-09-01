class NewsesController < ApplicationController
  before_filter :set_selected_page
  before_filter :authenticate_user!, :only=>[:edit, :update, :new, :create]
  before_filter :is_redactor, :except=>[:index, :new, :create]
  # GET /newses.json
  def index

    @newses=Newse.order( 'updated_at DESC' ).all #returns array of Newse

    @headers=Newse.select("id, name_#{locale} AS name_int").order( "updated_at DESC" ).limit( 10 )

    respond_to do |format|
      format.html # index.html.erb
      format.js { @show_section='#header' }
      format.json { render json: @headers }
    end
  end

  # GET /newses/1
  # GET /newses/1.json

  def show
    @newse = Newse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newse }
    end
  end

  # GET /newses/new
  # GET /newses/new.json
  def new
    @newse = Newse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newse }
    end
  end

  # GET /newses/1/edit
  def edit
    @newse = Newse.find(params[:id])
  end

  # POST /newses
  # POST /newses.json
  def create
    @newse = Newse.new(params[:newse])

    respond_to do |format|
      if @newse.save
        format.html { redirect_to newses_path, notice: t('newses.successfully_created') }
        format.json { render json: @newse, status: :created, location: @newse }
      else
        format.html { render action: "new" }
        format.json { render json: @newse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newses/1
  # PUT /newses/1.json
  def update
    @newse = Newse.find(params[:id])

    respond_to do |format|
      if @newse.update_attributes(params[:newse])
        format.html { redirect_to newses_path, notice: t('services.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newses/1
  # DELETE /newses/1.json
  def destroy
    @newse = Newse.find(params[:id])
    @newse.destroy

    respond_to do |format|
      format.html { redirect_to newses_url }
      format.json { head :no_content }
    end
  end

  private
  def set_selected_page
      @selected_page = 'news'
  end

  def is_redactor
    newse = Newse.find(params[:id])
    if (current_user.nil? or not(current_user.redactor?( newse.section )) )
      redirect_to request.referer, :notice =>( t('newses.not_allowed')+' '+t(newse.section.name) )
    end
  end


end
