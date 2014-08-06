require 'spec_helper'

describe "AdminController" do
  describe "routing" do
    it 'routes to admin dashboard index' do
      get('/admin').should route_to('admin/dashboard#index')
    end
  end
end