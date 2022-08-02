class GroupsController < ApplicationController
  before_action :set_group, only: %i[manage edit update destroy]

  def index
    @groups = current_user.groups
  end

  def show
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "Category was successfully created." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Category was successfully destroyed." }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :image, :author_id)
  end
end
