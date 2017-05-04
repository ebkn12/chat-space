class MessagesController < ApplicationController
  before_action :set_groups, only: [:new, :create]
  before_action :set_group, only: [:new, :create]

  def index
  end

  def new
    @message = Message.new
    @messages = @group.messages.includes(:user).order("created_at DESC")
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to new_group_message_path(@group), notice: "メッセージの送信に成功しました"
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      # render :new
    end
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

