require 'spec_helper'

describe 'home controller pages' do
  subject { page }
  describe 'index' do
    before { visit root_path }
    it { should have_title("Home | #{ENV['BASE_TITLE']}")}
    it { should have_css('a.navbar-brand', count: 1)}
    it { should have_link("#{ENV['BASE_TITLE']}", href: root_path)}
    it { should have_link('Home', href: root_path)}
    it { should have_link('About', href: about_path)}
    it { should have_link('Contact', href: contact_path)}
    it { should have_link('Sign in', href: new_user_session_path)}
    it { should have_link('Register', href: new_user_registration_path)}
    # because user is not signed in yet
    it { should_not have_link('Profile')}
    it { should_not have_link('Logout')}
  end
  describe 'about' do
    before { visit about_path }
    it { should have_title('About')}
    it { should have_selector('h2', text: 'About', count: 1)}
  end
  describe 'contact' do
    before { visit contact_path }
    it { should have_title('Contact')}
    it { should have_selector('h2', text: 'Contact', count: 1)}
  end
end