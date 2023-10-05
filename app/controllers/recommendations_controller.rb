class RecommendationsController < ApplicationController
  def create
    @consultation_request = ConsultationRequest.find(params[:request_id])
    @recommendation = @consultation_request.build_recommendation(recommendation_params)

    if @recommendation.save
      render json: @recommendation, status: :created
    else
      render json: { errors: @recommendation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:text)
  end
end