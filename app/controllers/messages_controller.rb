class MessagesController < ApplicationController
  before_action :set_groups
  before_action :set_group, only: :new

  def index
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end

  private
  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end

