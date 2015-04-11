require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creating a new user' do
    context 'valid user' do
      it 'has a valid factory' do
        user = create(:user)
        expect(user).to be_valid
      end
    end
    context 'invalid user' do
      it 'is invalid without provider' do
        user = build(:user, provider: nil)
        expect(user).not_to be_valid
      end
      it 'is invalid without uid' do
        user = build(:user, uid: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe 'class methods' do
    describe '::create_with_omniauth' do
      let(:hash){
        {
          "provider" => 'twitter',
               "uid" => '123456',
              "info" => {"name" => "test_user"},
       "credentials" => {"token" => "ponies", "secret" => "rainbows"}
        }
      }
      it 'creates a new user' do
        original_count = User.count
        User.create_with_omniauth(hash)
        new_count = User.count
        expect(original_count + 1).to eq(new_count)
      end
      it 'returns a user object' do
        user = User.create_with_omniauth(hash)
        expect(user).to be_a(User)
      end
      it 'creates a new user with correct attributes' do
        user = User.create_with_omniauth(hash)
        expect(user.provider).to eq('twitter')
        expect(user.uid).to eq('123456')
        expect(user.name).to eq('test_user')
        expect(user.token).to eq('ponies')
        expect(user.secret).to eq('rainbows')
      end
    end
  end


end
