class KrksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    

  def rank
    @krks = Krk.all
    @rank_krks = Krk.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
  end
  def index
    @krks = Krk.all
      
  end

  def new
    @krk = Krk.new
    @krks = Krk.all
  end
  
  
  def create
    krk = Krk.new(krk_params)
    krk.user_id = current_user.id
    if krk.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @krk = Krk.find(params[:id])
    @comments = @krk.comments
        @comment = Comment.new
  end
  def edit
    @krk = Krk.find(params[:id])
  end

  def update
    krk = Krk.find(params[:id])
    if krk.update(krk_params)
      redirect_to :action => "show", :id => krk.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    krk = Krk.find(params[:id])
    krk.destroy
    redirect_to action: :index
  end

  private
  def krk_params
    params.require(:krk).permit(:name, :genre, :about, :image)
  end
end
