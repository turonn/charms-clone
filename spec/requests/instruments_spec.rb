require "rails_helper"

RSpec.describe "Instrument management", :type => :request do
  let(:instrument_params) do
    { 
      instrument: {
        instrument: "clarinet",
        case_id: "yellow",
        make: "buffet",
        model: "R13",
        serial_number: "123abc",
        year: 2005,
        condition: "excellent",
        notes: "wonderful instrument on which to play",
        program_id: program.id
      }
    }
  end
  let(:program) { create(:program) }

  it "creates an Instrument and redirects to the Instrument's page" do
    get "/instruments/new"
    expect(response).to render_template(:new)

    post "/instruments", :params => instrument_params

    expect(response).to redirect_to(assigns(:instrument))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Instrument was successfully created.")
  end

  it "does not render a different template" do
    get "/instruments/new"
    expect(response).to_not render_template(:show)
  end
end
