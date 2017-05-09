class MessagesController < ApplicationController
  before_action :set_groups, only: [:new, :create]
  before_action :set_messages, only: :new

  def index
    @groups = current_user.groups
  end

  def new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      set_messages
      render :new
    end
  end

  private
  def set_groups
    @groups = current_user.groups
    @group = current_user.groups.find(params[:group_id])
  end

  def set_messages
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end

