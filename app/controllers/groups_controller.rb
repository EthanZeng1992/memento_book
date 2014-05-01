class GroupsController < ApplicationController

  #before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, :only => [:new, :create]

  #----------------------------------------------------------------------------
  def new
    @group = Group.new
  end

  #----------------------------------------------------------------------------
  def create
    @group  = Group.new(group_params)
    @school = @group.school

    respond_to do |format|
      if @group.save
        format.js
      else
        format.js
      end
    end
  end

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end


  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  #----------------------------------------------------------------------------
  private
  def set_group
    @group = Group.find(params[:id])
  end

  #----------------------------------------------------------------------------
  def group_params
    params.require(:group).permit(:name, :school_id)
  end

end
