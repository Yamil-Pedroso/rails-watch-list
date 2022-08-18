class MoviesController < ApplicationController
    def index
        @movies = Movie.all
      end

      def show
        @movie = Movie.find(params[:id])
      end

      def new #render the form
        @movie = Movie.new
      end

      def create

        @amovie = Movie.new(movie_params) #more secure than above with a hash

        if @movie.save
          redirect_to @movie
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @movie = Movie.find(params[:id])
      end

      def update
        @movie = Movie.find(params[:id])

        if @movie.update(movie_params)
          redirect_to @movie
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @movie = Article.find(params[:id])
        @movie.destroy

        redirect_to root_path, status: :see_other
      end

      private
        def movie_params
          params.require(:movie).permit(:title, :overview, :poster_url, :rating)
        end
end
