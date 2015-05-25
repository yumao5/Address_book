require 'rails_helper'

RSpec.describe  AdminUsersController, type: :controller do

    let(:user1) {AdminUser.create!(
                                  id: 1,
                                  createby: "admin",
                                  first_name:"first",
                                  last_name:"last",
                                  phone:"111111",
                                  email:"name@hotmail.com")}

    let(:user2) {AdminUser.create!(
                                  id: 2,
                                  createby: "admin",
                                  first_name:"first",
                                  last_name:"last",
                                  phone:"111111",
                                  email:"name@hotmail.com")}

    describe "Admin user controller check" do

    it 'index method check' do
      get :index
      response.code.should eq('302')
    end

    it 'new method check' do
      get :new
      response.code.should eq('302')
    end

    it '#Contact list API' do
      get :api_show_contacts, {content: {id: "1"}.to_json }
      response.code.should == '403'
    end

    it '#Remove contact API' do
      expect { get :api_dele_contact}.to raise_error
    end

    it '#Update contact API' do
      expect { get :api_update_contact }.to raise_error
    end

    it '#Create conact API' do
      expect { get :api_create_contact }.to raise_error
    end

    end
end
