class PatientsController < ApplicationController
  def recommendations
    @patient = Patient.find(params[:patient_id])
    @recommendations = @patient.consultation_requests.map(&:recommendation).compact

    render json: @recommendations
  end
end