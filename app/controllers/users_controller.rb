class UsersController < ApplicationController
  def search
    users = User.get_keyword(current_user.id, params[:keyword])
    respond_to do |format|
      format.json { render json: users }
    end
  end
end
