class SchoolsController < ApplicationController

  #before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, :only => [:new, :create, :index]

  #---------------------------------------------------------------------------
  def new
    @school = School.new
  end

  #---------------------------------------------------------------------------
  def create
    @school = School.new(school_params)
    @school.user = current_user

    respond_to do |format|
      if @school.save
        format.js
      else
        format.js
      end
    end
  end

  #---------------------------------------------------------------------------
  def index
    @schools = current_user.schools.ordered
  end



  def show
    @school = School.find(params[:id])
    @groups = @school.groups.all
  end




  # GET /schools/1/edit
  def edit
  end


  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  #---------------------------------------------------------------------------
  private
  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name)
  end

end
