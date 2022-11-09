require 'rails_helper'

RSpec.describe Program do
  describe "validations" do    
    context "when everything is correct" do
      subject { build(:program) }

      it { is_expected.to be_valid }
    end

    context 'without a name' do
      subject { build(:program, name: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
