class InstrumentsController < ApplicationController
  # before_action :_set_instrument, only: [:update, :destroy]

  def index
    instruments = _relevant_instruments
    render json: { status: 'SUCCESS', message: 'instrumets loaded', data: instruments }, status: :ok
  end

  def show
    instrument = Instrument.find(params[:id])
    render json: { status: 'SUCCESS', message: 'instrumet loaded', data: instrument }, status: :ok
  end

  def create
    instrument = Instrument.new(_instrument_params)

    if instrument.save
      render json: { status: 'SUCCESS', message: 'instrumet created', data: instrument }, status: :ok
    else
      render json: { status: 'ERROR', message: 'instrumet failed to create', data: instrument.errors },
             status: :unprocessable_entitiy
    end
  end

  def update
    instrument = Instrument.find(params[:id])

    if instrument.update_attributes(_instrument_params)
      render json: { status: 'SUCCESS', message: 'instrumet updated', data: instrument }, status: :ok
    else
      render json: { status: 'ERROR', message: 'instrumet failed to update', data: instrument.errors },
             status: :unprocessable_entitiy
    end
  end

  def destroy
    instrument = Instrument.find(params[:id])

    if instrument.destroy
      render json: { status: 'SUCCESS', message: 'instrumet deleted', data: instrument }, status: :ok
    else
      render json: { status: 'ERROR', message: 'instrumet not deleted', data: instrument.errors },
             status: :unprocessable_entitiy
    end
  end

  private

  # returns only the instruments for the given program
  # need to determine if there is a better way to do this
  def _relevant_instruments
    Instrument.all
    # @instruments = Instruments.where(program_id: params[:program_id])
  end

  def _instrument_params
    params.require(:instrument).permit(
      :instrument,
      :case_id,
      :make,
      :model,
      :serial_number,
      :year,
      :condition,
      :notes,
      :program_id
    )
  end
end
