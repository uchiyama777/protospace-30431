class UsersController < ApplicationController
  def show
    def show
      @name = current_user.name
      @prototypes = current_user.prototypes
    end
  end
end
