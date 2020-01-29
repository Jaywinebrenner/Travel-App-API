class ReviewsController < ApplicationController

  def index
     @reviews = Review.all
     json_response(@reviews)
   end

   def show
     @location = location.find(params[:location_id])
     @review = Review.find(params[:id])
     json_response(@review)
   end

   def create
     @location = location.find(params[:location_id])
     @review = Review.create(review_params)
     json_response(@review)
   end

   def update
     @review = Review.find(params[:id])
     if @review.update!(review_params)
       render status: 200, json: {
         message: "This review has been updated!"
       }
     end
   end

   def destroy
     @review = Review.find(params[:id])
     @review.destroy
   end

   private
   def json_response(object, status = :ok)
     render json: object, status: status
   end

   def review_params
     params.permit(:country, :city, :destination_id)
   end
 end
