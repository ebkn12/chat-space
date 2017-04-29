class MessagesController < ApplicationController
  before_action :open_chat

  def index
    @groups = Group.all
  end

  private
  def open_chat
    @groups = current_user.groups.all
    @group = current_user.groups.find(params[:group_id]) if params[:group_id]
  end
end
