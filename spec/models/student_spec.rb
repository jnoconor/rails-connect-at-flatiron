require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'creating a new student' do
    context 'valid student' do
      it 'has a valid factory' do
        student = create(:student)
        expect(student).to be_valid
      end
    end
  end

  describe 'associations' do
    context 'cohort' do
      it 'knows about its cohort' do
        cohort = create(:cohort)
        student = create(:student, :cohort => cohort)
        expect(student.cohort).to eq(cohort)
      end
    end
  end
end
