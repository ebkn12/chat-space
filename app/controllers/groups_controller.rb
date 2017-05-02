class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to new_group_message_path(@group), notice: "グループ作成に成功しました"
    else
      redirect_to new_group_path, alert: "グループ作成に失敗しました"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
