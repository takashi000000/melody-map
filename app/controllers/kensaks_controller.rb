class KensaksController < ApplicationController
    def index 
    end
    def new
        @kensak = Kensak.new
      end
      def show
        @kensak = Kensak.find(params[:id])
      end
      def create
        @kensak = Kensak.new(kensak_params)
        params[:kensak][:question] ? @kensak.question = params[:kensak][:question].join("") : false
        if @kensak.save
            flash[:notice] = "診断が完了しました"
            redirect_to kensak_path(@kensak.id)
        else
            redirect_to :action => "new"
        end
      end
    
    private
      def kensak_params
          params.require(:kensak).permit(:id, question: [])
      end
    end