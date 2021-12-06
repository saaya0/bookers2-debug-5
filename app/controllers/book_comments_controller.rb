class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end

	def destroy
		@book_comment = BookComment.find(params[:book_id])
		if @book_comment.user != current_user
    		redirect_to request.referer
		else
    		 @book_comment.destroy
    		redirect_to request.referer
    	end

	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

end