require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  let(:user) {AdminUser.create!(first_name:"first",
                                last_name:"last",
                                phone:"111111",
                                email:"name@hotmail.com")}

  describe "AdminUser model check" do
      it "Firt Name check" do
          user.first_name == "first"
      end

      it "Last Name check" do
          user.last_name == "last"
      end

      it "Email check" do
          user.email == "email"
      end

      it "Phone check" do
          user.phone == "111111"
      end
  end

end
