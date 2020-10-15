class UsersController < ApplicationController
  def show
      # @user = User.find_by(id: params[:id])
      @user = User.find(params[:id])
      @prototypes = @user.prototypes
  end
end
