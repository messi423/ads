module Api
    module V1
        class UsersController < ApplicationController
            #protect_from_forgery with: :null_session
            before_action :authorized, only: [:auto_login]

            def index
                @users = User.all
                #render json: UserSerializer.new(users, options).serialized_json
                #puts "sajba"
                #puts users
                render json: @users
            end

            def show
                @user = User.find_by(id: params[:user_id])
                render json: UserSerializer.new(@user, options).serialized_json
            end


            #$2a$12$i3ciDIz9g6Yrd3xGfj7DN.oruWJ9bUWPfPkQHxgrnbwPJMxclb046
            def create
                @user = User.create(user_params)
                if @user.valid?
                  token = encode_token({user_id: @user.id})
                  render json: {user: @user, token: token}
                else
                  render json: {error: "Invalid username or password"}
                end
            end

            def login
                @user = User.find_by(name: params[:name])
            
                if @user && @user.authenticate(params[:password])
                  token = encode_token({user_id: @user.id})
                  render json: {user: @user, token: token}
                else
                  render json: {error: "Invalid username or password"}
                end
            end


            def auto_login
                render json: @user
            end

            private

            #check that
            def user_params
                params.permit(:name, :email, :password)
            end

            #to pass related data i.e. which depends on this model
            def options
                @options ||= {include: %i[ads, comments]}
            end

        end
    end
end