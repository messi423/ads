module Api
    module V1
        class CommentsController < ApplicationController
            def index
                comments = Comment.all
                render json: CommentSerializer.new(comments).serialized_json
            end

            def create
                comment = Comment.new(comment_params)

                if comment.save
                    render json: CommentSerializer.new(comment).serialized_json
                else
                    render json: {error: comment.errors.message}, status: 422
            end

            private

            def comment_params
                params.require(:comment).permit(:text, :user_id, :ad_id)
            end
            
        end
    end
end