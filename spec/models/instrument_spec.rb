require 'rails_helper'

RSpec.describe Instrument do
  describe 'validations' do
    context 'when everything is correct' do
      subject { build(:instrument) }

      it { is_expected.to be_valid }
    end

    context 'without an instrument name' do
      subject { build(:instrument, instrument: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'without a program' do
      subject { build(:instrument, program: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
