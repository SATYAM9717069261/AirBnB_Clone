class Api::V1::TodosController < ApplicationController
    before_action :authenticate_user!

    def index
        @todos=Todo.all
        render json: @todos
    end

    def show
        @todo = Todo.find_by_id(params[:id])
        render json: @todo
    end

    def create 
        @todo = Todo.new(valid_params)
        if @todo.save
            render json: @todo, status: 200
        else
            render json: @todo.error, status: :unprocessable_entity
        end
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo
            @todo.update(valid_params)
            render json: {message: "Update Sucessfull"}, status: 200
        else
            render json:{error: "cant Find"}, status: 500
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        if @todo
            @todo.destroy
            render json: {messsage: "Todo Destroy"}, status:200
        else
            render json: {error: "Can't Destroy"}, status:500
        end
    end

    private

    def valid_params
        params.require(:todo).permit(:title,:is_completed,:status)
    end

end