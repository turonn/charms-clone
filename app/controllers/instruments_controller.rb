class InstrumentsController < ApplicationController
  before_action :_set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :_relevant_instruments, only: [:index]

  def index
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(_instrument_params)

    if @instrument.save
      redirect_to instruments_path, notice: "Instrument was successfully created."
    else
      render :new, notice: "Instrument failed to be created."
    end
  end

  def edit
  end

  def update
    if @instrument.update(_instrument_params)
      redirect_to instruments_path, notice: "Instrument was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path, notice: "Instrument wdas successfully destroyed."
  end

  private

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
