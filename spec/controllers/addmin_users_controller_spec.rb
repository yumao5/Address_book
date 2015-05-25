require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe  AdminUsersController, type: :controller do

  let(:user) {AdminUser.create!(first_name:"first",
                                last_name:"last",
                                phone:"111111",
                                id: "1",
                                email:"name@hotmail.com")}

   describe "#Admin user controller check" do

      it 'index method check' do
        get :index
        expect(response.status).to eq 302
      end

      it 'new method check' do
        get :new
        expect(response.status).to eq 302
      end
    end

    describe "#Api check" do

      it '#Contact list API' do
        expect { get :api_show_contacts, {content: {id: "1"}.to_json } }.to_not raise_error
      end

      it '#Contact list API' do
        expect { get :api_show_contacts, {content: {id: ""}.to_json } }.to raise_error
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
