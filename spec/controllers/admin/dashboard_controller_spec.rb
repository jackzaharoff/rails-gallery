require 'spec_helper'

describe Admin::DashboardController do

  describe "GET 'index'" do
    it 'returns http success' do
      get :index
      response.should redirect_to new_user_session_path
    end
  end

end
