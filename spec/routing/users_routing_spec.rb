require 'spec_helper'

describe UsersController do
  describe 'routing' do

    it 'routes to devise/sessions#new' do
      get('/sign_in').should route_to('devise/sessions#new')
    end

    it 'routes to devise/sessions#create' do
      post('sign_in').should route_to('devise/sessions#create')
    end

    it 'routes to devise/sessions#destroy' do
      delete('sign_out').should route_to('devise/sessions#destroy')
    end

    it 'routes to devise/registrations#new' do
      get('register').should route_to('devise/registrations#new')
    end

    it 'routes to devise/registrations#create' do
      post('register').should route_to('devise/registrations#create')
    end

    it 'routes to devise/registrations#cancel' do
      get('users/cancel').should route_to('devise/registrations#cancel')
    end

    it 'routes to devise/registrations#edit' do
      get('edit_profile').should route_to('devise/registrations#edit')
    end

    it 'routes to devise/registrations#update' do
      patch('users').should route_to('devise/registrations#update')
    end

    it 'put users routes to devise/registrations#update' do
      put('users').should route_to('devise/registrations#update')
    end

    it 'delete users routes to devise/registrations#destroy' do
      delete('users').should route_to('devise/registrations#destroy')
    end

#    it "routes to #index" do
#      get("/users").should route_to("users#index")
#    end
#
#    it 'routes to #new' do
#      get('/users/new').should route_to('users#new')
#    end
#
#    it "routes to #show" do
#      get("/users/1").should route_to("users#show", :id => "1")
#    end
#
#    it "routes to #edit" do
#      get("/users/1/edit").should route_to("users#edit", :id => "1")
#    end
#
#    it "routes to #create" do
#      post("/users").should route_to("users#create")
#    end
#
#    it "routes to #update" do
#      put("/users/1").should route_to("users#update", :id => "1")
#    end
#
#    it "routes to #destroy" do
#      delete("/users/1").should route_to("users#destroy", :id => "1")
#    end
#
  end
end
