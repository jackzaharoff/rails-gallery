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
    it { should have_button('Register')}
    include_examples 'devise shared links'
    describe 'process' do
      before do
        fill_in 'Email', with: 'test_1@example.com'
        fill_in 'Username', with: 'test_1'
        fill_in 'Password', with: '123456789'
        fill_in 'Password confirmation', with: '123456789'
      end
      #TODO make possible to return to previous URL after registration, not just redirect to root_path
      it { expect{ click_button 'Register' }.to change(User, :count).by(1) and redirect_to(root_path)}
    end
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
      it { should have_link('Profile', href: edit_user_registration_path)}
      it { should have_link('Logout', href: destroy_user_session_path)}
      it { should have_css('h4.alert-notice', text: 'Signed in successfully.', count: 1)}
      describe 'after sign in' do
        describe 'do not display sign in form' do
          before { visit new_user_session_path }
          it { should have_content('You are already signed in.')}
        end
        describe 'do not display registration form' do
          before { visit new_user_registration_path }
          it { should have_content('You are already signed in.')}
        end
      end
    end
  end

  describe 'signing out' do
    let(:confirmed_user) { FactoryGirl.create(:confirmed_user)}
    before do
      sign_in confirmed_user
      click_link 'Logout'
    end
    it { should have_css('h4.alert-notice', text: 'Signed out successfully.', count: 1)}
  end
end