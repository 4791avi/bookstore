class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_review, only: [:edit,:update,:destroy]
	before_action :authenticate_user! ,only:[:new,:edit]
	def new
		@review = Review.new
	end

	def create

		@review = Review.new(review_params)
		@review.book_id = @book.id
		@review.user_id = current_user.id

		puts @book.id
		puts current_user.id
		puts @review.inspect

		if @review.save
			puts "****saving the data*****"
			redirect_to book_path(@book)
		else
			puts "***********not saved data*********"
			render 'new'
		end	
		@review.errors.full_messages
	end

	def edit
		
	end

	def update
		
		if @review.update(review_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to book_path(@book)
	end



private

	def review_params
		params.require(:review).permit(:rating,:comment)

	end

	def find_book
		@book =Book.find(params[:book_id])
	end

	def find_review
		@review = Review.find(params[:id])	
	end
end
