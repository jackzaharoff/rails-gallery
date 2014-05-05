require 'spec_helper'
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
  end
end