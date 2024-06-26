class Api::V1::Overland::BatchesController < ApplicationController
  skip_forgery_protection

  def create
    Overland::BatchCreatingJob.perform_later(batch_params)

    render json: { result: 'ok' }, status: :created
  end

  private

  def batch_params
    params.permit(locations: [:type, geometry: {}, properties: {}], batch: {})
  end
end
