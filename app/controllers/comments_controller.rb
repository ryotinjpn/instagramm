class CommentsController < ApplicationController
    def create
        @pic = Pic.find(params[:pic_id])
        @pic.comments.create(comment_params)
        redirect_to pic_path(@pic)
    end

    def destroy
        @pic = Pic.find(params[:pic_id])
        @comment = @pic.comments.find(params[:id])
        @comment.destroy
        redirect_to pic_path(@pic)
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
