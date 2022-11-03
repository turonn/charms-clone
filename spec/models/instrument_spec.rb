require 'rails_helper'

RSpec.describe Instrument do
  describe "validations" do    
    context "when everything is correct" do
      subject { build(:instrument) }

      it { is_expected.to be_valid }
    end
  end
end