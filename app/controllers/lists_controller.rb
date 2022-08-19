class ListsController < ApplicationController
    before_action :set_list, only: %i[ show edit update destroy ]

    def index
      @lists = List.all
    end

    def show
    end

    def new
      @list = List.new
    end


    def edit
    end


    def create
      @list = List.new(list_params)

      if @list.save
        redirect_to @list, notice: "Article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @list.update(list_params)
        redirect_to @list, notice: "Photos was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @list.destroy
      redirect_to root_path, notice: "Photo was successfully destroyed."
    end

    private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :body, photos: [])
    end
end
