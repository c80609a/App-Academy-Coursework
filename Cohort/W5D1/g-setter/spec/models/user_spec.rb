require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user, username: "bob", password: "password")
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  it 'creates a password digest' do
    expect(user.password_digest).to_not be_nil
  end

  it 'creates a session token before validation' do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe '#reset_session_token!' do
    it 'sets a new session token on the user' do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      #I am indexing tokens on uniqueness, should not fail
      expect(user.session_token). to_not eq(old_session_token)
    end

    it 'returns the new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe '#is_password?' do
    it 'verifies that the password is correct' do
      expect(user.is_password?("password")).to be true
    end
    it 'verifies that a wrong password is not correct' do
      expect(user.is_password?("badpass")). to be false
    end
  end

  describe '::find_by_credentials' do
    before { user.save! }
    it 'returns a user when given good credentials' do
      expect(User.find_by_credentials("bob", "password")).to eq(user)
    end
    it 'returns a nil when given invalid corrections' do
      expect(User.find_by_credentials("bob", "badpass")).to eq(nil)
    end
  end
end
