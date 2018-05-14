require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#is_password?' do
    it 'checks password when correct' do
      jack = User.create(username: 'jack', password: 'abcdef')
      expect(jack.is_password?('abcdef')).to be true
    end

    it 'checks password when incorrect' do
      jack = User.create(username: 'jack', password: 'abcdef')
      expect(jack.is_password?('abcdeff')).to be false
    end
  end

  describe '#reset_session_token!' do
    it 'resets a session_token' do
      jack = User.create(username: 'jack', password: 'abcdef')
      session_t = jack.session_t
      jack.reset_session_token!
      expect(jack.session_token).not_to be_(session_t)
    end
  end

  describe 'User::find_by_credentials' do
    it 'assigns a session_token if one is not given' do
      jack = User.create(username: 'jack', password: 'abcdef')
      expect(User.find_by_credentials).to be_(jack)
    end
  end

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }

end
