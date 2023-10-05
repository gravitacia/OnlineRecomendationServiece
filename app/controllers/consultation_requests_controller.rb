class ConsultationRequestsController < ApplicationController
  def create
    @patient = Patient.find(params[:patient_id])
    @consultation_request = @patient.consultation_requests.build(consultation_request_params)

    if @consultation_request.save
      render json: @consultation_request, status: :created
    else
      render json: { errors: @consultation_request.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def consultation_request_params
    params.require(:consultation_request).permit(:text, :date_created)
  end
end