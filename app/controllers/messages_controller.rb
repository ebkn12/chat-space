class MessagesController < ApplicationController
  before_action :set_groups
  before_action :set_group, only: :new

  def index
  end

  def new
  end

  private
  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end

