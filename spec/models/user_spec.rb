require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user)}
  subject { user }
  it { should be_valid }
  it { should respond_to(:email)}
  it { should respond_to(:username)}
  it { should validate_presence_of(:username)}
  it { should validate_uniqueness_of(:username)}
  describe 'when username is too short' do
    before { user.username = 'aa'}
    it { expect(user).not_to be_valid}
  end
  describe 'when username is too long' do
    before { user.username = 'a'*41 }
    it { expect(user).not_to be_valid}
  end

end
