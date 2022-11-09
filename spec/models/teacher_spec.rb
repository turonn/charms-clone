require 'rails_helper'

RSpec.describe Teacher do
  describe "validations" do    
    context "when everything is correct" do
      subject { build(:teacher) }

      it { is_expected.to be_valid }
    end

    context 'without an email_address' do
      subject { build(:teacher, email_address: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
