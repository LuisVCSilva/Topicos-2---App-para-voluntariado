class UsersController::InvitationsController < Devise::InvitationsController
  def show
    @user = User.find(params[:id])
  end

  def update
  end

end

