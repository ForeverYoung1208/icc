#encoding utf-8
class UserSectionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
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
        format.html { redirect_to user_sections_path, notice: t('user_sections.successfully_created') }
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
        format.html { redirect_to @user_section, notice: t('user_sections.successfully_updated')}
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

  def reset_u_pwd
    User.find_by_id(params[:id]).update_attributes({
        password: '123456',
        password_confirmation: '123456'
      })

    redirect_to user_sections_path, :notice => t('user_sections.password_reset')
  end

  def delete_user
    User.find_by_id(params[:id]).destroy
    redirect_to user_sections_path, :notice => t('user_sections.user_deleted')
  end


  private

  def is_admin
    if !current_user.admin?
      redirect_to request.referer, :notice => t('user_sections.not_allowed')
    end
  end


end
