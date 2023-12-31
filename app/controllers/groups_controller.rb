# Controller for groups.
class GroupsController < ApplicationController
  before_action :set_group, only: %i[show update destroy]

  # GET /groups
  def index
    @user = current_user
    @groups = @user.groups.includes(:entities).order(id: :desc)
  end

  def create
    add_group = current_user.groups.new(group_params)
    # @group = Group.new(group_params)

    if add_group.save
      # render json: @group, status: :created, location: @group
      redirect_to groups_path, notice: 'Category added successfully'
    else
      # render json: @group.errors, status: :unprocessable_entity
      render :new, status: :unprocessable_entity, alert: 'Failed to add category'
    end
  end

  # PATCH/PUT /groups/1
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Category updated successfully'
    else
      render :edit, alert: 'Failed to update category'
    end
  end

  # DELETE /groups/1
  def destroy
    @user = current_user
    @group = Group.find(params[:id])

    if @group.destroy
      redirect_to groups_path, notice: 'Category removed successfully'
    else
      render :index, alert: 'Failed to remove category'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  def determine_layout
    user_signed_in? ? 'application' : 'unauthenticated'
  end

  # Only allow a list of trusted parameters through.
  def group_params
    # params.require(:group).permit(:name, :icon)
    params.permit(:name, :icon)
  end
end
