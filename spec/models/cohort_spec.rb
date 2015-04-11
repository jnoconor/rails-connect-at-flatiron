require 'rails_helper'

RSpec.describe Cohort, type: :model do
  describe 'creating a new cohort' do
    context 'valid cohort' do
      it 'has a valid factory' do
        cohort = create(:cohort)
        expect(cohort).to be_valid
      end
    end
    context 'invalid cohort' do
      it 'is invalid without a name' do
        cohort = build(:cohort, name: nil)
        expect(cohort).not_to be_valid
      end
      it 'is invalid without a unique name' do
        cohort = create(:cohort, name: "first cohort!")
        cohort = build(:cohort, name: "first cohort!")
        expect(cohort).not_to be_valid
      end
    end
  end

  describe 'associations' do
    context 'students' do
      it 'knows about its students' do
        cohort = create(:cohort)
        student = create(:student, :cohort => cohort)
        expect(cohort.students).to include(student)
      end
    end
  end
end
