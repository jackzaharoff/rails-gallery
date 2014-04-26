require 'spec_helper'

describe "home controller pages" do
  describe "index" do
    before { visit root_path }
    subject { page }
    it { should have_title("Home | #{ENV['BASE_TITLE']}")}
    it { should have_css('div#branding', count: 1)}
  end
end