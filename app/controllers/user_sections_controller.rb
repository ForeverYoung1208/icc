class UserSectionsController < ApplicationController
  # GET /user_sections
  # GET /user_sections.json
  def index
    @user_sections = UserSection.order('user_id ASC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_sections }
    end
  end

  # GET /user_sections/1
  # GET /user_sections/1.json
  def show
    @user_section = UserSection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_section }
    end
  end

  # GET /user_sections/new
  # GET /user_sections/new.json
  def new
    @user_section = UserSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_section }
    end
  end

  # GET /user_sections/1/edit
  def edit
    @user_section = UserSection.find(params[:id])
  end

  # POST /user_sections
  # POST /user_sections.json
  def create
    user=User.find_by_id(params[:user_section][:user])
    user.sections << Section.find_by_id(params[:user_section][:section])
    
    respond_to do |format|
      if user.save
        format.html { redirect_to user_sections_path, notice: 'User-section was successfully created.' }
#        format.json { render json: @user_section, status: :created, location: @user_section }
      else
        format.html { render action: "new" }
#        format.json { render json: @user_section.errors, status: :unprocessable_entity }
      end
    end
 
  end

  # PUT /user_sections/1
  # PUT /user_sections/1.json
  def update
    @user_section = UserSection.find(params[:id])

    respond_to do |format|
      if @user_section.update_attributes(params[:user_section])
        format.html { redirect_to @user_section, notice: 'User section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sections/1
  # DELETE /user_sections/1.json
  def destroy
    @user_section = UserSection.find(params[:id])
    @user_section.destroy

    respond_to do |format|
      format.html { redirect_to user_sections_url }
      format.json { head :no_content }
    end
  end
end
