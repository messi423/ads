module Api
    module V1
        class CommentsController < ApplicationController
            #protect_from_forgery with: :null_session
            before_action :authorized 

            def index
                comments = Comment.all
                render json: CommentSerializer.new(comments).serialized_json
            end

            def create
                comment = Comment.new(comment_params)
                comment.user_id = @user.id

                if comment.save
                    render json: CommentSerializer.new(comment).serialized_json
                else
                    render json: {error: comment.errors.message}, status: 422
                end
            end

            private

            def comment_params
                params.require(:comment).permit(:text, :ad_id, :user:id)
            end

        end
    end
end