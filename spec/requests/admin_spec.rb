require 'spec_helper'

describe "admin area" do
  subject { page }
  describe "when user is guest" do
    before { get '/admin'}
    it { should redirect_to(new_user_session_path) }
  end
  describe "when user is not authorized" do
    let(:user) { FactoryGirl.create(:confirmed_user) }
    before do
      sign_in user
      visit admin_path
    end
    after { sign_out }
    it { should have_title('Home')}
    it { should have_content('Not authorized.')}
  end
  describe "when user is authorized" do
    let(:admin) { FactoryGirl.create(:admin_user)}
    describe 'index' do
      before do
        sign_in admin
        visit admin_path
      end
      it { should have_title('Administration')}
      it { should have_selector('h1', text: 'Administration')}

    end
  end

end