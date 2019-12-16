class ReviewsController < ApplicationController
  before_action :find_book
  before_action :find_review, only: [:edit, :update, :destroy]

  def index
    @review = Review.all
  end

  def new
    @review = Review.new

  end

  def create
    @review = Review.new(param_requirements)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    @review.name

    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
        format.json { render :'books/show', status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(param_requirements)
      redirect_to book_path(@book)
    else
      redirect_to root_path
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to root_path , notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def param_requirements
      params.require(:review).permit(:rating, :comment, :name)
    end

    def find_book
      @book = Book.find(params[:book_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
