module Api
    module V1
        class AdsController < ApplicationController
            #protect_from_forgery with: :null_session
            before_action :authorized # only: [:create, :destroy, :update, :index, :show]

            def index
                ads = Ad.all
                render json: AdSerializer.new(ads, options).serialized_json
            end

            def show
                ad = Ad.find_by(id: params[:ad_id])
                render json: AdSerializer.new(ad, options).serialized_json
            end

            def create
                ad = Ad.new(ad_params)
                #ad.user_id = @user.id

                if ad.save
                    render json: AdSerializer.new(ad).serialized_json
                else
                    render json: {error: ad.error.messages}, status: 422
                end
            end

            def update
                ad = Ad.find_by(id: params[:ad_id])

                if ad.update(ad_params)
                    render json: AdSerializer.new(ad, options).serialized_json
                else
                    render json: {error: ad.error.messages}, status: 422
                end
            end

            def destroy
                ad = Ad.find_by(id: params[:ad_id])

                if ad.destroy
                    head :no_content
                else
                    render json: {error: ad.error.messages}, status: 422
                end
            end

            private

            #check that
            def ad_params
                params.require(:ad).permit(:title, :body, :user_id)
            end

            #to pass related data i.e. which depends on this model
            def options
                @options ||= {include: %i[comments]}
            end
        end
    end
end