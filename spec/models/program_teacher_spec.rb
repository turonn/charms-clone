require 'rails_helper'

RSpec.describe ProgramTeacher do
  describe "validations" do    
    context "when everything is correct" do
      subject { build(:program_teacher) }

      it { is_expected.to be_valid }
    end

    context "without a program" do
      subject { build(:program_teacher, program: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without a teacher" do
      subject { build(:program_teacher, teacher: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
