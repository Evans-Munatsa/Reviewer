class RatesController < ApplicationController
  before_action :find_book
  before_action :find_rate, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(rate_params)
    @rate.book_id = @book.id
    @rate.user_id = current_user.id

    if @rate.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @rate.update(rate_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @rate.destroy
    redirect_to book_path(@book)
  end

  private

  def rate_params
    params.require(:rate).permit(:ratings, :comment)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_rate
    @rate = Rate.find(params[:id])
  end
end
