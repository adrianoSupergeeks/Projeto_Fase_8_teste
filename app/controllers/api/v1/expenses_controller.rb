class Api::V1::ExpansesController < ApplicationController
    before_action :authenticate_with_token!
    
    def index
        expanses = current_user.expanses
        render json: {expanses: expanses}, status: 200
    end
    
    def show
        expanse = current_user.expanses.find(params[:id])
        render json: expanse, status: 200
    end
    
    def create
        expanse = current_user.expanses.build(expanse_params)
        if expanse.save
            render json: expanse, status 201
        else
            render json: {errors: expanse.errors}, status 422
        end
    end

    def update
        expanse = current_user.expanses.find(params[:id])
        if expanse.update_attributes(expanse_params)
            render json: expanse, status: 200
        else
            render json: {errors: expanse.errors}, status 422
        end
    end
    
    def destroy
        expanse = current_user.expanses.find(params[:id])
        expanse.destroy
        head 204
    end
    
    private
    
    def expanse_params
         params.require(:expanse).permit(description, :value, :date)
    end
end


