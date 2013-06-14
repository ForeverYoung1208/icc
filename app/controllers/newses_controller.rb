class NewsesController < ApplicationController
  before_filter :set_selected_page  # GET /newses
  # GET /newses.json
  def index
    @newses = Newse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newses }
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
        format.html { redirect_to @newse, notice: 'Newse was successfully created.' }
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
        format.html { redirect_to @newse, notice: 'Newse was successfully updated.' }
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

end
