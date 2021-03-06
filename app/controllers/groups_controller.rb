class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update show]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to new_group_message_path(@group), notice: 'グループ作成に成功しました'
    else
      flash.now[:alert] = 'グループ作成に失敗しました'
      render :new
    end
  end

  def edit
    @users = @group.users
  end

  def update
    if @group.update(group_params)
      redirect_to new_group_message_path(@group), notice: 'グループ編集に成功しました'
    else
      flash.now[:alert] = 'グループ編集に失敗しました'
      render :edit
    end
  end

  def show
    redirect_to edit_group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
