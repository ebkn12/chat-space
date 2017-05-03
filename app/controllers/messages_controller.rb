class MessagesController < ApplicationController
  before_action :set_groups
  before_action :set_group, only: :new

  def index
  end

  def new
  end

  def create
    @message = Message.find(params[:id])
    @message.create(message_params)
  end

  private
  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def message_params
    params.require(:group).permit(:text, :image)
  end
end

