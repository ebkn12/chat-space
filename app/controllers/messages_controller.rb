class MessagesController < ApplicationController
  before_action :set_group, only: :new

  def index
    @groups = current_user.groups
  end

  def new
    @groups = current_user.groups
  end

  private
  def set_group
    # binding.pry
    @group = current_user.groups.find(params[:group_id])
  end
end
