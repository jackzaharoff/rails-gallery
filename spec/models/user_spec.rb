require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user)}
  subject { user }
  it { should respond_to(:email)}
  it { should respond_to(:username)}
  it { should validate_presence_of(:username)}
  it { should validate_uniqueness_of(:username)}

end
