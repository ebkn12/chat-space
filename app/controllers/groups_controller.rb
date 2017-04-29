class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = User.all
  end

  def create
    binding.pry
    Group.create(group_params)
    redirect_to :root
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
