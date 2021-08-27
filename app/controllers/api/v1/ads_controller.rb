module Api
    module V1
        class AdsController < ApplicationController
            def index
                ads = Ad.all
                render json: AdSerializer.new(ads, options).serialized_json
            end

            def show
                ad = Ad.find_by(ad_id: params[:ad_id])
                render json: AdSerializer.new(ad, options).serialized_json
            end

            def create
                ad = Ad.new(ad_params)

                if ad.save
                    render json: AdSerializer.new(ad).serialized_json
                else
                    render json: {error: ad.error.messages}, status: 422
            end

            def update
                ad = Ad.find_by(ad_id: params[:ad_id])

                if ad.update(ad_params)
                    render json: AdSerializer.new(ad, options).serialized_json
                else
                    render json: {error: ad.error.messages}, status: 422
            end

            def destroy
                ad = Ad.find_by(ad_id: params[:ad_id])

                if ad.destroy
                    head :no_content
                else
                    render json: {error: ad.error.messages}, status: 422
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