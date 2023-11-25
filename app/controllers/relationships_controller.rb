class RelationshipsController < ApplicationController
    def create
        current_user.handle(params[:user_id])
        redirect_to request.referer
    end
      
    def destroy
        current_user.unhandle(params[:user_id])
        redirect_to request.referer
    end
end
