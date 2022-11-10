class InstrumentsController < ApplicationController
  before_action :_set_instrument, only: [:update, :destroy]

  def index
    instruments =  Instrument.all #_relevant_instruments
    render json: {status: 'SUCCESS', message: 'instrumets loaded', data: instruments}, status: :ok
  end

  def create
    @instrument = Instrument.new(_instrument_params)

    if @instrument.save
      render json: @instrument
    else
      render json: 500
    end
  end

  def update
    if @instrument.update_attributes(_instrument_params)
      render json: @instrument
    else
      render json: 500
    end
  end

  def destroy
    @instrument.destroy ? render json: 200 : render json: 500
  end

  private

  # returns only the instruments for the given program
  # need to determine if there is a better way to do this
  def _relevant_instruments
    @instruments = Instruments.where(program_id: params[:program_id])
  end

  def _set_instrument
    @instrument = Instrument.find(params[:id])
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
