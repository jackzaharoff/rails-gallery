require 'spec_helper'

shared_examples 'devise shared links' do
  describe 'shared links in sign up, sign in, log in forms' do
    it { should have_link("Didn't receive confirmation instructions?")}
    it { should have_link("Didn't receive unlock instructions?")}
  end
end

describe 'Authentication' do
  subject { page }
  describe 'signup' do
    before { visit new_user_registration_path }
    it { should have_title('Sign up')}
    it { should have_selector('h2', text: 'Sign up')}
    it { should have_field('Email')}
    it { should have_field('Username')}
    it { should have_field('Password')}
    it { should have_field('Password confirmation')}
    include_examples 'devise shared links'
  end
  describe 'sign in' do
    before { visit new_user_session_path }
    it { should have_title('Sign in')}
    it { should have_selector('h2', text: 'Sign in')}
    it { should have_field('Email', count: 1)}
    it { should have_field('Password', count: 1)}
    it { should have_field('Remember me', count: 1)}
    it { should have_link('Register', href: new_user_registration_path, count: 2)}
    include_examples 'devise shared links'

    describe 'process' do
      let(:confirmed_user) { FactoryGirl.create(:confirmed_user) }
      before { sign_in confirmed_user }
      it { should_not have_link('Sign in')}
      it { should_not have_link('Register')}
      it { should have_content("Hi, #{confirmed_user.username}")}
    end
  end
end