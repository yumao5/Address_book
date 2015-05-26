require 'rails_helper'

RSpec.describe AdminUser, type: :model do

     it "@ Model valid check" do
          user = AdminUser.new(
            first_name: 'Aaron',
            last_name: 'Sumner',
            email: 'tester@example.com')
          expect(user).to be_valid
     end

     it "@ Model valid check" do
          user = AdminUser.new(
            first_name: 'AaronSumnerSumnerSumnerSumnerSumnerSumnerSumnerSumner',
            last_name: 'Sumner',
            email: 'tester@example.com')
          expect(user).to be_invalid
     end

     it "@ Model instance mothod check" do
       user = AdminUser.new(
         first_name: 'Aaron',
         last_name: 'Sumner',
         email: 'tester@example.com')

       expect(user.name).to eq 'Aaron Sumner'
     end

end
