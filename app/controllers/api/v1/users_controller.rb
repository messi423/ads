module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.all
                render json: UserSerializer.new(users, options).serialized_json
            end

            def show
                user = User.find_by(user_id: params[:user_id])
                render json: UserSerializer.new(user, options).serialized_json
            end

            def create
                user = User.new(user_params)

                if user.save
                    render json: UserSerializer.new(user).serialized_json
                else
                    render json: {error: user.error.messages}, status: 422
            end

            def update
                user = User.find_by(user_id: params[:user_id])

                if user.update(user_params)
                    render json: UserSerializer.new(user, options).serialized_json
                else
                    render json: {error: user.error.messages}, status: 422
            end

            def destroy
                user = User.find_by(user_id: params[:user_id])

                if user.destroy
                    head :no_content
                else
                    render json: {error: user.error.messages}, status: 422
            end

            private

            #check that
            def user_params
                params.require(:user).permit(:name, :email, :password_digest)
            end

            #to pass related data i.e. which depends on this model
            def options
                @options ||= {include: %i[ads, comments]}
            end
        end
    end
end