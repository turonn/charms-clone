require 'rails_helper'

RSpec.describe Program do
  describe "validations" do    
    context "when everything is correct" do
      subject { build(:program) }

      it { is_expected.to be_valid }
    end
  end
end
