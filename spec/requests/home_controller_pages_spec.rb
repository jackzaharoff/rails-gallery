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
  end
  describe 'about' do
    before { visit about_path }
    it { should have_title('About')}
  end
  describe 'contact' do
    before { visit contact_path }
    it { should have_title('Contact')}
  end
end