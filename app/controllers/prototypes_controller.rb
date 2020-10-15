class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index, :edit, :show]
  #before_action :configure_permitted_parameters, if: :devise_controller?

  def index
     @prototypes = Prototype.all
  end

  def new
     @prototype = Prototype.new
  end

  def create
     @prototype = Prototype.new(prototype_params)
     if @prototype.save
      redirect_to root_path
     else
       render :new
     end
  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
   end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      render :index
   end
 end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation :position])
   # passwordとemailが許可されているので、他に必要の情報を追加する
  #end

  def move_to_edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
