class ReviewsController < ApplicationController
  before_action :set_movie

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path, notice: 'Movie was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def review_params
    return params.require(:review).permit(:name, :comment, :stars)
  end

end
