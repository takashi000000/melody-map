class LikesController < ApplicationController
  
    def create
        like = current_user.likes.create(krk_id: params[:krk_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
      def index
        @krk = Krk.find(params[:krk_id])
        @likes = @krk.likes
      end
      def destroy
        like = Like.find_by(krk_id: params[:krk_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end
end
