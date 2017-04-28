class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    binding.pry
    Group.create(group_params)
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  private
  def group_params
    params.permit(:name)
  end
end
