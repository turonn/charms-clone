require 'rails_helper'

RSpec.describe Teacher do
  describe "validations" do    
    context "when everything is correct" do
      subject { build(:teacher) }

      it { is_expected.to be_valid }
    end
  end
end
