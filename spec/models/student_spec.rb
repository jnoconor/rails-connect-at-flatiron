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

  describe 'username extracting' do
    let(:student) { create(:student, twitter: twitter_link, github: github_link) }

    context 'when the user has typical service link entries' do 
      let(:github_link) { "http://github.com/jnoconor" }
      let(:twitter_link) { "http://www.twitter.com/boredelonmusk" }

      it "#twitter_handle correctly extracts the user's Twitter username" do
        expect(student.twitter_handle).to eq('boredelonmusk')
      end

      it "#github_handle correctly extracts the user's Github username" do
          expect(student.github_handle).to eq('jnoconor')
      end
    end

    context 'when the user has no link entries' do 
      let(:github_link) { nil }
      let(:twitter_link) { nil }

      it "#twitter_handle returns an empty string" do
        expect{ student.twitter_handle }.to_not raise_error
        expect(student.twitter_handle).to eq('')
      end

      it "#github_handle returns an empty string" do
        expect{ student.github_handle }.to_not raise_error
        expect(student.github_handle).to eq('')
      end

    end
  end
end
